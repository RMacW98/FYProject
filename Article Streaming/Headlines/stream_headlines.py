import psycopg2
import pandas as pd
from newsapi import NewsApiClient

# Create your views here.
top_headlines = pd.DataFrame(columns=['title', 'desc', 'outlet', 'img', 'url', 'publishedAt'])


def index():
    newsapi = NewsApiClient(api_key='cc3f4e3191f149658f3922e9c47ec1ad')
    headlines = newsapi.get_top_headlines(q='bitcoin',
                                          category='business',
                                          language='en')
    articles = headlines['articles']
    source = []
    desc = []
    news = []
    img = []
    url = []
    published = []

    for i in range(len(articles)):
        article = articles[i]
        source.append(article['source']['name'])
        desc.append(article['description'])
        news.append(article['title'])
        img.append(article['urlToImage'])
        url.append(article['url'])
        published.append(article['publishedAt'])

    top_headlines['title'] = news
    top_headlines['desc'] = desc
    top_headlines['outlet'] = source
    top_headlines['img'] = img
    top_headlines['url'] = url
    top_headlines['publishedAt'] = published

    top_headlines['title'] = top_headlines['title'].str.replace("'", "\''")
    top_headlines['desc'] = top_headlines['desc'].str.replace("'", "\''")

    top_headlines['publishedAt'] = pd.to_datetime(top_headlines['publishedAt']).dt.strftime('%Y-%m-%d %H:%M')

    return top_headlines


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

    def insert_db(self, df):
        cur = self.con.cursor()

        for i in range(len(df)):
            cur.execute(
                'INSERT INTO "newsApp_article" (title, description, pic, url, date_posted, outlet)'
                f" VALUES ('{df['title'][i]}','{df['desc'][i]}','{df['img'][i]}','{df['url'][i]}','{df['publishedAt'][i]}'::timestamp,'{df['outlet'][i]}');")

        self.con.commit()

        self.con.close()


if __name__ == "__main__":
    database_client = DatabaseClient()

    top_stories = index()
    database_client.insert_db(top_stories)