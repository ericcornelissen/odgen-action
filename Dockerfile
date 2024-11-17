FROM python:3.8

ADD . /app
WORKDIR /app

RUN git submodule update --init
WORKDIR /app/ODGen

RUN git apply ../patches/exit_code.patch

RUN apt-get update
RUN apt-get install npm -y
RUN ./install.sh
