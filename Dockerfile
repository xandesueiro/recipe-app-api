FROM python:3.7-alpine
# MAINTAINER Trilhando Saber Labs

# Recommended when run python in docker containers
ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# Setup directory structure
RUN mkdir /app
# "WORKDIR /app" create a empty directory in the project 
WORKDIR /app
COPY ./ /app

# Create an user named "user" that basically just runs the application. It avoids the image uses the root account
RUN adduser -D user
USER user
