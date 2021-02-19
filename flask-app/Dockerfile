FROM python:3.6
COPY ./requirements.txt .

RUN apt-get update && apt-get install -y \
    freetds-bin \
    freetds-common \
    freetds-dev \ 
    supervisor \
    redis

RUN pip install -r requirements.txt


RUN mkdir /app
WORKDIR /app
COPY entry_point.sh entry_point.sh

EXPOSE 3019


CMD ./entry_point.sh
