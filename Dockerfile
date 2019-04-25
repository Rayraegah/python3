FROM python:3.7-alpine

RUN apk update && \
	apk add \
		build-base

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

COPY ./Pipfile* .

RUN pip install --upgrade pip && \
	pip install pipenv && \
	pipenv install --system --deploy

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY . .
