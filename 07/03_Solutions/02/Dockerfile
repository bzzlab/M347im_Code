# Implement docker healthcheck and stopsignal using dockerfile
# Containerize a simple flask deploy
#
# install ubuntu 18.04
FROM ubuntu:18.04
# update OS
RUN apt-get update -y \
    && apt-get install -y python3-pip python3-dev curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# set environment variable LC_ALL to C.UTF-8
ENV LC_ALL=C.UTF-8
# set environment variable LANG to C.UTF-8
ENV LANG=C.UTF-8
# deploy app
COPY ./deploy /app
# set working directory to app
WORKDIR /app
# install dependencies
RUN pip3 install -r requirements.txt
# start taskmanager
CMD [ "python3", "task_manager.py"]
