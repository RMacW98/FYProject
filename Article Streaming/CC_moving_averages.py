"""
    Script to calculate the moving averages score from the sentiment dimension
    Author: Ross MacWilliam
    Date: 01/02/2021
"""

import pandas as pd
import numpy as np
import psycopg2
from datetime import datetime, timedelta, date


class DatabaseClient:
    """
    Functionality for inserting and reading from the database
    """

    def __init__(self):
        # Connect to db
        self.con = psycopg2.connect(
            host='fyp_postgresql',
            database='postgres',
            user='postgres',
            password='postgres'
        )
        self.article_table = pd.DataFrame()

    def read_db(self):
        cur = self.con.cursor()

        cur.execute("SELECT full_date, hour, trading_symbol, comp_sentiment FROM sentiment_fact"
                    " JOIN date_dim ON sentiment_fact.dateid = date_dim.dateid"
                    " JOIN time_dim ON sentiment_fact.timeid = time_dim.timeid;")

        rows = cur.fetchall()

        self.article_table = pd.DataFrame(data=rows, columns=['dateid', 'timeid', 'trading_symbol', 'compound'])

        return self.article_table

    def insert_db(self, df):
        cur = self.con.cursor()

        for i in range(len(df)):
            cur.execute(f"SELECT dateid FROM date_dim WHERE full_date = '{df.dateid}'")
            dateid = cur.fetchall()

            cur.execute(f"SELECT timeid FROM time_dim WHERE hour = '{df.timeid}'")
            timeid = cur.fetchall()

            cur.execute(
                "INSERT INTO ma_sentiment_dim (dateid, timeid, trading_symbol, comp_sentiment, sma, ema)"
                f" VALUES ({dateid[0][0]}, {timeid[0][0]}, '{df['trading_symbol']}', {df['compound']}, {df['SMA']}, {df['EWM']});")

        self.con.commit()

        self.con.close()


class SentimentProcessor:
    """
    Functionality for inserting and reading from the database
    """

    def __init__(self):
        pass

    def calculate_moving_averages(self, overall_headlines):
        overall_headlines['datetime'] = pd.to_datetime(overall_headlines.dateid,
                                                       infer_datetime_format=True) + df.timeid.astype('timedelta64[h]')

        overall_headlines.index = pd.DatetimeIndex(overall_headlines['datetime'])
        overall_headlines = overall_headlines.drop(['datetime'], axis=1)

        # Remove duplicate columns
        overall_headlines = overall_headlines[~overall_headlines.index.duplicated()]

        now = datetime.now().strftime('%Y-%m-%d %H:00:00')

        overall_headlines = overall_headlines.asfreq('H', how=now)

        overall_headlines['SMA'] = overall_headlines.compound.rolling(window=48, min_periods=1).mean()
        overall_headlines['EWM'] = overall_headlines.compound.ewm(span=14).mean()
        overall_headlines['trading_symbol'] = 'BTC'
        overall_headlines['timeid'] = overall_headlines.index.hour
        overall_headlines['dateid'] = overall_headlines.index.strftime('%d/%m/%Y')

        overall_headlines.loc[(overall_headlines['compound'].isnull()), 'compound'] = 'NULL'
        overall_headlines.loc[(overall_headlines['SMA'].isnull()), 'SMA'] = 'NULL'
        overall_headlines.loc[(overall_headlines['EWM'].isnull()), 'EWM'] = 'NULL'

        return overall_headlines


if __name__ == "__main__":
    database_client = DatabaseClient()
    df = database_client.read_db()

    # Append current hour to end of dataframe
    end = datetime.now()
    df = df.append({'dateid':end.strftime('%d/%m/%Y'), 'timeid':end.hour, 'trading_symbol':'BTC', 'compound':None}, ignore_index=True)

    sentiment_processor = SentimentProcessor()
    headlines_df = sentiment_processor.calculate_moving_averages(df)

    # Insert last value in the dataframe to database
    database_client.insert_db(headlines_df.iloc[-1])
