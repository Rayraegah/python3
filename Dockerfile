FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apk update && \
	apk add \
		build-base

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

COPY ./Pipfile* .

RUN pip install --upgrade pip && \
	pip install pipenv && \
	pipenv install --system --deploy --skip-lock

COPY . .
