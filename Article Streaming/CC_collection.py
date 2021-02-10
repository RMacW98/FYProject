"""
    Script to stream news articles and compare sentiment against cryptocurrency price
    Author: Ross MacWilliam
    Date: 01/02/2021
"""

import re
from time import sleep
import pandas as pd
import numpy as np
import psycopg2
import requests
import argparse
from bs4 import BeautifulSoup
from datetime import datetime, timedelta


from newsapi import NewsApiClient


parser = argparse.ArgumentParser()

parser.add_argument('tradesymbol', help="Add a trading symbol against the USDT")
parser.add_argument('query', help="Add a trading symbol against the USDT")
parser.add_argument('-v', '--verbose', help='Turn on verbose mode', action='store_true')

args = parser.parse_args()

trading_symbol = args.tradesymbol
query = args.query

headers = {
    'accept': '*/*',
    'accept-encoding': 'gzip, deflate, br',
    'accept-language': 'en-US,en;q=0.9',
    'referer': 'https://www.google.com',
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36 Edg/85.0.564.44'
}
date = datetime.today().strftime("%d%m%Y")
todays_date = datetime.today().strftime("%Y-%m-%d")
yesterdays_date = (datetime.today() - timedelta(days=1)).strftime("%Y-%m-%d")


# # # # NEWS API AUTHENTICATER # # # #
class NewsAuthenticator():
    """
    Functionality for authenticating News API
    """

    def authenticate_news_api(self):
        auth = NewsApiClient(api_key='cc3f4e3191f149658f3922e9c47ec1ad')
        return auth


# # # # NEWS API STREAMER # # # #
class NewsAPIArticleStreamer():
    """
    Class for streaming and processing articles daily
    """

    def __init__(self):
        self.news_authenticator = NewsAuthenticator()

    def stream_articles(self, query, from_param, to):
        # This handles Twitter authetification and the connection to News API
        newsapi = self.news_authenticator.authenticate_news_api()

        # Function to call all articles regarding query between set dates
        all_articles = newsapi.get_everything(q=query,
                                              from_param=from_param,
                                              to=to,
                                              language='en')

        return all_articles


class NewsAPIArticleCleaner():
    """
    Functionality for importing and cleaning news api articles
    """

    def import_json(self, fetched_json_file):
        # Import json and normalize data
        df = pd.read_json(fetched_json_file)
        norm_articles = pd.json_normalize(df['articles'])

        return norm_articles

    def clean_article(self, article):
        return ' '.join(re.sub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)", " ", article).split())

    def create_article(self, articles):
        article = articles[['author', 'title', 'description', 'url', 'source.name', 'publishedAt']]
        article['publishedAt'] = pd.to_datetime(article['publishedAt'], infer_datetime_format=True)
        article.sort_values(by='publishedAt', inplace=True)
        article = article.reset_index()
        article = article.drop(['index'], axis=1)

        outlet = articles[['source.id', 'source.name']]

        return article, outlet


# # # # YAHOO FINANCE STREAMER # # # #
class YahooArticleStreamer:
    """
    Class for streaming and processing articles daily from Yahoo Finance
    """

    def __init__(self):
        pass

    def get_article(self, card):
        """
        Extract article information from the raw html
        :param card: divs containing news articles
        :return: articles
        """
        headline = card.find('h4', 's-title').text
        source = card.find("span", 's-source').text
        posted = card.find('span', 's-time').text.replace('·', '').strip()
        description = card.find('p', 's-desc').text.strip()
        raw_link = card.find('a').get('href')
        unquoted_link = requests.utils.unquote(raw_link)
        pattern = re.compile(r'RU=(.+)\/RK')

        try:
            clean_link = re.search(pattern, unquoted_link).group(1)
        except:
            clean_link = None

        article = (headline, source, posted, description, clean_link)
        return article

    def get_the_news(self, query):
        """
        Run beautiful soup to extract the html
        :param query: query yahoo with this variable
        :return all articles in dataframe format
        """
        article_headers = ['title', 'outlet', 'uploaded', 'description', 'url']

        template = 'https://news.search.yahoo.com/search?p={}'
        url = template.format(query)
        articles = []
        links = set()

        while True:
            response = requests.get(url, headers=headers)
            soup = BeautifulSoup(response.text, 'html.parser')
            cards = soup.find_all('div', 'NewsArticle')

            # extract articles from page
            for card in cards:
                article = self.get_article(card)
                link = article[-1]
                if not link in links:
                    links.add(link)
                    articles.append(article)

                    # find the next page
            try:
                url = soup.find('a', 'next').get('href')
                sleep(1)
            except AttributeError:
                break

        all_articles = pd.DataFrame(articles, columns=article_headers)

        return all_articles


class ArticleCleaner():
    """
    Functionality for importing and cleaning news articles
    """

    def import_json(self, fetched_json_file):
        """
        Import json and normalize data
        :return normalized data
        """
        df = pd.read_json(fetched_json_file)
        norm_articles = pd.json_normalize(df['articles'])

        return norm_articles

    def clean_article(self, article):
        """
        Clean dataframe of all 'dirty' grammar
        """

        return ' '.join(re.sub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)", " ", article).split())

    def create_article(self, articles):
        article = articles[['author', 'title', 'description', 'url', 'source.name', 'publishedAt']]
        outlet = articles[['source.id', 'source.name']]

        return article, outlet

    def get_recent_articles(self, all_articles):
        recent_articles = pd.DataFrame()

        for index, row in all_articles.iterrows():
            if 'minute' in row.uploaded:
                recent_articles = recent_articles.append(row)

            if 'second' in row.uploaded:
                recent_articles = recent_articles.append(row)

        time = []
        hours = recent_articles['uploaded'].str.split(' ')
        df = pd.DataFrame(hours.values.tolist(), index=hours.index)
        hours_ago = df[0]

        for index, hours in hours_ago.items():
            if int(hours) < 24:
                d = datetime.today() - timedelta(hours=int(hours), minutes=0)
                time.append(d.strftime("%Y-%m-%d %H:%M:%S"))
            else:
                d = datetime.today() - timedelta(hours=0, minutes=int(hours))
                time.append(d.strftime("%Y-%m-%d %H:%M:%S"))

        recent_articles['publishedAt'] = time
        # recent_articles = recent_articles.drop(['uploaded'])

        return recent_articles


class DatabaseClient:
    """
    Functionality for inserting and reading from the database
    """

    def __init__(self):
        # Connect to db
        self.con = psycopg2.connect(
            host='DESKTOP-VSKLGP8',
            database='postgres',
            user='postgres',
            password='postgres'
        )
        self.article_table = pd.DataFrame()

    def read_db(self):
        cur = self.con.cursor()

        cur.execute("SELECT  full_date, hour, title, comp_sentiment FROM article_fact"
                    " JOIN date_dim ON article_fact.dateid = date_dim.dateid"
                    " JOIN time_dim ON article_fact.timeid = time_dim.timeid;")

        rows = cur.fetchall()

        self.article_table = pd.DataFrame(data=rows, columns=['date', 'hour', 'clean_title', 'compound'])

        self.con.close()

        return self.article_table

    def insert_db(self, df):
        cur = self.con.cursor()

        for i in range(len(df)):
            cur.execute(f"SELECT dateid FROM date_dim WHERE full_date = '{df.date[i]}'")
            dateid = cur.fetchall()

            cur.execute(f"SELECT timeid FROM time_dim WHERE hour = '{df.hour[i]}'")
            timeid = cur.fetchall()

            cur.execute(
                f"INSERT INTO article_fact1 (dateid, timeid, title, url, comp_sentiment) VALUES ({dateid[0][0]}, {timeid[0][0]}, '{df['clean_title'][i]}', 'null', {df['compound'][i]});")

        self.con.commit()

        self.con.close()


def main():
    """
    Main function
    :return: None
    """
    article_cleaner = ArticleCleaner()
    yahoo_article_streamer = YahooArticleStreamer()

    news_api_streamer = NewsAPIArticleStreamer()
    news_api_cleaner = NewsAPIArticleCleaner()

    database_client = DatabaseClient()

    news_api_articles = news_api_streamer.stream_articles(query, yesterdays_date, todays_date)
    yahoo_articles = yahoo_article_streamer.get_the_news(query)

    news_article_data = pd.json_normalize(news_api_articles['articles'])
    news_api_df, outlets = news_api_cleaner.create_article(news_article_data)
    news_api_df['publishedAt'] = pd.to_datetime(news_api_df['publishedAt'], infer_datetime_format=True)

    yahoo_clean_title = np.array([article_cleaner.clean_article(article) for article in yahoo_articles['title']])
    yahoo_clean_desc = np.array([article_cleaner.clean_article(article) for article in yahoo_articles['description']])

    news_api_clean_title = np.array([article_cleaner.clean_article(article) for article in news_api_df['title']])
    news_api_clean_desc = np.array([article_cleaner.clean_article(article) for article in news_api_df['description']])

    yahoo_articles['clean_title'] = yahoo_clean_title
    yahoo_articles['clean_description'] = yahoo_clean_desc

    news_api_df['clean_title'] = news_api_clean_title
    news_api_df['clean_description'] = news_api_clean_desc

    recent_yahoo_articles = article_cleaner.get_recent_articles(yahoo_articles)

    all_headlines = recent_yahoo_articles[['publishedAt', 'clean_title']]
    all_headlines = all_headlines.append(news_api_df[['publishedAt', 'clean_title']])
    all_headlines['publishedAt'] = pd.to_datetime(all_headlines['publishedAt'])

    #database_client.insert_db(df)
    print(all_headlines)


if __name__ == "__main__":
    main()