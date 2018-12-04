# Python3

Dockerfile with `python3` on `alpine linux 3.6` with support for `pipenv` and 
`postgres`. 

The same project runs responder with graphql. This project servers as a host for my Dockerfile and does not contain any useful software.

## Dockerfile Explained

```Dockerfile

FROM python:3.6.1-alpine

```

Inherits from the official alpine python image. This is the lightest container.


```Dockerfile

RUN apk update && \
  	apk add \
    build-base \
    postgresql \
    postgresql-dev \
    libpq

```

Updates packages and install dependencies


```Dockerfile

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

```
Makes a new directory for the app


```Dockerfile

COPY ./Pipfile .
COPY ./Pipfile.lock .

```
Copies the Pipfiles to the app working directory


```Dockerfile

RUN pip install --upgrade pip && \
	pip install pipenv && \
	pipenv install --system --deploy

```
Upgrades pip and deploys pipenv dependencies to system folder. This 
installation step adds 215 MB as 65 packages.


```Dockerfile

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY . .

```
Set environment variables and copies current directory into app working 
directory.


## Getting Started

In a `docker-compose.yml` file use `rayraegah:python3` as image.

## Testing

Clone this repository and run command `docker-compose up -d`

## License

Released under MIT License