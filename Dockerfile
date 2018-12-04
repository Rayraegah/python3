FROM python:3.6.1-alpine

RUN apk update && \
  	apk add \
    build-base \
    postgresql \
    postgresql-dev \
    libpq

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

COPY ./Pipfile .
COPY ./Pipfile.lock .

RUN pip install --upgrade pip && \
	pip install pipenv && \
	pipenv install --system --deploy

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY . .