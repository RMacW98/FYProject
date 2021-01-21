import re
import csv
from time import sleep
from bs4 import BeautifulSoup
import requests
import json
import pandas as pd
import numpy as np


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

        # save article data
        with open('results.csv', 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerow(['Headline', 'Source', 'Posted', 'Description', 'Link'])
            writer.writerows(articles)

        return articles


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


if __name__ == '__main__':
    fetched_json_file = './news_articles.json'
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

    all_articles = article_streamer.get_the_news(query)

    # Export json
    with open(fetched_json_file, 'w') as f:
        json.dump(all_articles, f)

    article_data = article_cleaner.import_json(fetched_json_file)
    articles, outlets = article_cleaner.create_article(article_data)

    clean_title = np.array([article_cleaner.clean_article(article) for article in articles['title']])
    clean_desc = np.array([article_cleaner.clean_article(article) for article in articles['description']])

    articles['clean_title'] = clean_title
    articles['clean_description'] = clean_desc

    articles.to_csv(r'.\cleaned_articles_crypto.csv', index=False)
    outlets.to_csv(r'.\outlets.csv', index=False)