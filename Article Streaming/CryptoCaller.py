import re
import csv
from time import sleep
import requests
import json
import pandas as pd
import numpy as np
import requests
import bs4
from bs4 import BeautifulSoup
import datetime
from datetime import datetime, timedelta, date

import pandas_datareader as pdr
import matplotlib.pyplot as plt

from newsapi import NewsApiClient
from yahoofinancials import YahooFinancials
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from sklearn.metrics import confusion_matrix, classification_report, accuracy_score


# # # # NEWS API AUTHENTICATER # # # #
class NewsAuthenticator:

    def authenticate_news_api(self):
        auth = NewsApiClient(api_key='cc3f4e3191f149658f3922e9c47ec1ad')
        return auth


# # # # NEWS API STREAMER # # # #
class NewsAPIArticleStreamer:
    """
    Class for streaming and processing articles daily
    """

    def __init__(self):
        self.news_authenticator = NewsAuthenticator()

    def stream_articles(self, query, from_param, to):
        # This handles Twitter authetification and the connection to Twitter Streaming API
        newsapi = self.news_authenticator.authenticate_news_api()
        all_articles = newsapi.get_everything(q=query,
                                              from_param=from_param,
                                              to=to,
                                              language='en')

        return all_articles


class NewsAPIArticleCleaner:
    """
    Functionality for importing and cleaning news articles
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
        """Extract article information from the raw html"""
        headline = card.find('h4', 's-title').text
        source = card.find("span", 's-source').text
        posted = card.find('span', 's-time').text.replace('·', '').strip()
        description = card.find('p', 's-desc').text.strip()
        raw_link = card.find('a').get('href')
        unquoted_link = requests.utils.unquote(raw_link)
        pattern = re.compile(r'RU=(.+)\/RK')
        clean_link = re.search(pattern, unquoted_link).group(1)

        article = (headline, source, posted, description, clean_link)
        return article

    def get_the_news(self, query):
        """Run the main program"""
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

        # for article in all_articles:
        #    if article.uploaded

        return all_articles


class ArticleCleaner:
    """
    Functionality for importing and cleaning news articles
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
        outlet = articles[['source.id', 'source.name']]

        return article, outlet

    def get_recent_articles(self, all_articles):
        recent_articles = pd.DataFrame()

        for index, row in all_articles.iterrows():
            if 'hour' in row.uploaded:
                recent_articles = recent_articles.append(row)

            if 'minute' in row.uploaded:
                recent_articles = recent_articles.append(row)

            if 'second' in row.uploaded:
                recent_articles = recent_articles.append(row)

        time = []
        hours = recent_articles['uploaded'].str.split(' ')
        df = pd.DataFrame(hours.values.tolist(), index=hours.index)
        hours_ago = df[0]

        for index, hours in hours_ago.items():
            if hours < 24:
                d = datetime.today() - timedelta(hours=int(hours), minutes=0)
                time.append(d.strftime("%Y-%m-%d %H:%M"))
            else:
                d = datetime.today() - timedelta(hours=0, minutes=int(hours))
                time.append(d.strftime("%Y-%m-%d %H:%M"))

        recent_articles['publishedAt'] = time
        recent_articles = recent_articles.drop(['uploaded'])

        return recent_articles


class SentimentAnalyzer:
    """
    Functionality for analyzing headlines sentiment
    """

    def __init__(self):
        self.data = pd.read_csv('./datasets/headlines_labelled.txt',
                                sep='\t', header=None)
        self.scores_df = pd.DataFrame()

        # New words and values
        self.new_words = {
            'crushes': 10,
            'beats': 5,
            'misses': -5,
            'trouble': -10,
            'falls': -100,
            'slides': -50,
            'slide': -50,
            'record high': 15,
            'low': -15,
            'one week low': -30,
            'worth more': 5,
            'digital gold': 5,
            'high': 15,
            'cryptocurrency fund': 10,
            'up': 5,
            'soars': 70,
            'rebound': 20,
            'pullback': -40,
            'slumps': -60,
            'jumps': 50,
            'record low': -100,
            'soaring': 70,
            'bearish': -50,
            'bullish': 50,
            'bulls': 10,
            'bears': -10,
            'hodl': 10,
            'pulls back': -40,
            'selloff': -70,
            'retrace': -70,
            'drop': -50,
            'buying': 10,
            'selling': -10,
            'rally': 15,
            'bounces': 20,
            'testing support': -5,
            'climb': 5,
            'rise': 20,
            'crashes': -100,
            'crash': -100,
            'downward': -30,
            'plunges': -100,
            'plunge': -80,
            'cardano': 0,
            'descends': -30,
            'descend': -30,
            'gain': 20,
            'gains': 20,
            'worst': -25,
            'loss': -15,
            'without risk': 10,
            'tumbles': -50,
            'jeopardy': -50
        }

    def reading_dataset(self):
        columnName = ['Headlines', 'Sentiment']
        self.data.columns = columnName
        self.data.head()

        return self.data

    def analyze_test_headlines(self):
        # Instantiate the sentiment intensity analyzer with the existing lexicon
        vader = SentimentIntensityAnalyzer()

        # Update the lexicon
        vader.lexicon.update(self.new_words)

        data = self.reading_dataset()

        # Iterate through the headlines and get the polarity scores
        scores = data['Headlines'].apply(vader.polarity_scores)

        # Convert the list of dicts into a DataFrame
        scores_df = pd.DataFrame.from_records(scores)

        # Join the DataFrames
        scored_news = data.join(scores_df)

        scored_news['assigned_label'] = scored_news['Sentiment'].apply(
            lambda Sentiment: 'pos' if Sentiment > 0 else 'neg')
        scored_news['predicted_label'] = scored_news['compound'].apply(
            lambda compound: 'pos' if compound >= 0 else 'neg')

        return scored_news

    def analyze_recent_headlines(self, data):
        # Instantiate the sentiment intensity analyzer with the existing lexicon
        vader = SentimentIntensityAnalyzer()

        # Update the lexicon
        vader.lexicon.update(self.new_words)

        # Iterate through the headlines and get the polarity scores
        # scores = data['clean_title'].apply(vader.polarity_scores)

        self.scores_df['neg'] = [vader.polarity_scores(x)['neg'] for x in data['clean_title']]
        self.scores_df['neu'] = [vader.polarity_scores(x)['neu'] for x in data['clean_title']]
        self.scores_df['pos'] = [vader.polarity_scores(x)['pos'] for x in data['clean_title']]
        self.scores_df['compound'] = [vader.polarity_scores(x)['compound'] for x in data['clean_title']]

        # Convert the list of dicts into a DataFrame
        # scores_df = pd.DataFrame.from_records(scores)

        # Join the DataFrames
        data = data.reset_index()
        scored_news = data.merge(self.scores_df, left_index=True, right_index=True, how='inner')

        scored_news['predicted_label'] = scored_news['compound'].apply(
            lambda compound: 'pos' if compound > 0 else ('neu' if compound == 0 else 'neg'))

        return scored_news


class PriceStreamer:
    """
    Functionality for constantly streaming BTC price
    """
    def __init__(self):
        pass


    def parse_price(self):
        res = requests.get('https://finance.yahoo.com/quote/BTC-USD?p=BTC-USD&.tsrc=fin-srch')
        soup = bs4.BeautifulSoup(res.text, 'lxml')

        price = soup.find_all('span', class_='Trsdu(0.3s) Fw(b) Fz(36px) Mb(-4px) D(ib)')[0].text
        price_change = soup.find_all('span', class_='Trsdu(0.3s) Fw(500) Pstart(10px) Fz(24px) C($positiveColor)')[
            0].text

        return price, price_change

    def get_hist_data(self):
        cryptocurrencies = ['BTC-USD', 'ETH-USD', 'ADA-USD']
        yahoo_financials_cryptocurrencies = YahooFinancials(cryptocurrencies)

        d6 = (datetime.date.today() - datetime.timedelta(days=6)).strftime("%Y-%m-%d")
        d13 = (datetime.date.today() - datetime.timedelta(days=13)).strftime("%Y-%m-%d")

        daily_crypto_prices = yahoo_financials_cryptocurrencies.get_historical_price_data(d13, d6, 'daily')
        data = pd.DataFrame.from_records(daily_crypto_prices)
        price_df = pd.json_normalize(data['BTC-USD']['prices'])

        return price_df


if __name__ == '__main__':
    query = 'cryptocurrency'
    headers = {
        'accept': '*/*',
        'accept-encoding': 'gzip, deflate, br',
        'accept-language': 'en-US,en;q=0.9',
        'referer': 'https://www.google.com',
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36 Edg/85.0.564.44'
    }
    date = date.today().strftime("%Y%m%d")
    todays_date = date.today().strftime("%Y-%m-%d")
    yesterdays_date = (date.today() - timedelta(days=1)).strftime("%Y-%m-%d")

    article_cleaner = ArticleCleaner()
    yahoo_article_streamer = YahooArticleStreamer()

    news_api_streamer = NewsAPIArticleStreamer()
    news_api_cleaner = NewsAPIArticleCleaner()

    sentiment_analyzer = SentimentAnalyzer()

    news_api_articles = news_api_streamer.stream_articles(query, yesterdays_date, todays_date)
    yahoo_articles = yahoo_article_streamer.get_the_news(query)

    news_article_data = pd.json_normalize(news_api_articles['articles'])
    news_api_df, outlets = article_cleaner.create_article(news_article_data)
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

    yahoo_scored_news = sentiment_analyzer.analyze_recent_headlines(recent_yahoo_articles)
    news_api_scored_news = sentiment_analyzer.analyze_recent_headlines(news_api_df)

    high_yahoo_news = yahoo_scored_news[(yahoo_scored_news['compound'] > .5) | (yahoo_scored_news['compound'] < -0.5)]
    high_news_api_news = news_api_scored_news[(news_api_scored_news['compound'] > .5) | (news_api_scored_news['compound'] < -0.5)]

    final_yahoo_news = high_yahoo_news[['publishedAt', 'clean_title', 'compound']]
    final_news_api = high_news_api_news[['publishedAt', 'clean_title', 'compound']]

    final_news = final_yahoo_news.append(final_news_api)
    final_news = final_news.reset_index(drop=True)

    final_news['date'] = pd.to_datetime(final_news['publishedAt'], format='%Y-%m-%d')
    final_news['date'] = final_news['date'].dt.strftime('%Y-%m-%d')

    final_news.to_csv(f'.\{date}sentiment.csv', index=False)
