# Dockerfile, Image, Container

FROM python:3.8

ADD CC_unification_linux.py .
ADD CC_moving_averages.py .

RUN pip install pandas
RUN pip install numpy
RUN pip install psycopg2
RUN pip install bs4
RUN pip install matplotlib
RUN pip install shrimpy-python
RUN pip install nltk
RUN pip install newsapi-python

CMD ["python", "CC_unification_linux.py", "BTC", "bitcoin"]