# Dockerfile, Image, Container

FROM python:3.8

ADD stream_headlines.py .

RUN pip install pandas
RUN pip install psycopg2
RUN pip install newsapi-python

CMD ["python", "stream_headlines.py"]