FROM python:3.7-alpine
MAINTAINER Trilhando Saber Labs

# Recommended when run python in docker containers
ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Setup directory structure
RUN mkdir /app
# "WORKDIR /app" create a empty directory in the project 
WORKDIR /app
COPY ./ /app

# Create an user named "user" that basically just runs the application. It avoids the image uses the root account
RUN adduser -D user
USER user