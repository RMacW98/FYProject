import re
import csv
from time import sleep
from bs4 import BeautifulSoup
import requests
import json
import pandas as pd
import numpy as np

from nltk.sentiment.vader import SentimentIntensityAnalyzer
from sklearn.metrics import confusion_matrix, classification_report, accuracy_score


# # # # NEWS API STREAMER # # # #
class ArticleStreamer():
    """
    Class for streaming and processing articles daily
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

        return all_articles


class ArticleCleaner():
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


class SentimentAnalyzer():
    """
    Functionality for analyzing headlines sentiment
    """

    def __init__(self):
        self.data = pd.read_csv('./datasets/headlines_labelled.txt',
                                sep='\t', header=None)

    def reading_dataset(self):
        columnName = ['Headlines', 'Sentiment']
        self.data.columns = columnName
        self.data.head()

        return self.data

    def analyze_headlines(self):
        # New words and values
        new_words = {
            'crushes': 10,
            'beats': 5,
            'misses': -5,
            'trouble': -10,
            'falls': -100,
            'slides': -50,
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

        }

        # Instantiate the sentiment intensity analyzer with the existing lexicon
        vader = SentimentIntensityAnalyzer()

        # Update the lexicon
        vader.lexicon.update(new_words)

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


if __name__ == '__main__':
    query = 'cryptocurrency'
    headers = {
        'accept': '*/*',
        'accept-encoding': 'gzip, deflate, br',
        'accept-language': 'en-US,en;q=0.9',
        'referer': 'https://www.google.com',
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36 Edg/85.0.564.44'
    }

    article_cleaner = ArticleCleaner()
    article_streamer = ArticleStreamer()
    sentiment_analyzer = SentimentAnalyzer()

    all_articles = article_streamer.get_the_news(query)

    clean_title = np.array([article_cleaner.clean_article(article) for article in all_articles['title']])
    clean_desc = np.array([article_cleaner.clean_article(article) for article in all_articles['description']])

    all_articles['clean_title'] = clean_title
    all_articles['clean_description'] = clean_desc

    all_articles.to_csv(r'.\results.csv', index=False)

    scored_news = sentiment_analyzer.analyze_headlines()

    scored_news.to_csv(r'.\sentiment.csv', index=False)