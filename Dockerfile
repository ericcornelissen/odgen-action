FROM python:3.8

WORKDIR /app
ADD patches/ /app/patches

RUN git clone https://github.com/Song-Li/ODGen.git
WORKDIR /app/ODGen
RUN git checkout c5157ee9f560a93364708ff2276dba71d1967cc3

RUN git apply ../patches/exit_code.patch

# Install dependencies
RUN apt-get update
RUN apt-get install npm -y
RUN ./install.sh
