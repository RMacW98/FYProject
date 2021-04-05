# Dockerfile, Image, Container

FROM python:3.8

ADD CC_moving_averages.py .

RUN pip install pandas
RUN pip install numpy
RUN pip install psycopg2
RUN pip install shrimpy-python


CMD ["python", "CC_moving_averages.py"]