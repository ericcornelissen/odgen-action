FROM python:3.8

# Initialize the container
WORKDIR /app
ADD patches/ /app/patches

# Get ODGen into the container
RUN git clone https://github.com/Song-Li/ODGen.git
WORKDIR /app/ODGen
RUN git checkout c5157ee9f560a93364708ff2276dba71d1967cc3

# Apply improvement patches to ODGen
RUN git apply ../patches/exit_code.patch \
	&& git apply ../patches/pin_babel_deps.patch \
	&& git apply ../patches/pip_requirements.patch

# Install ODGen dependencies
RUN apt-get update \
	&& apt-get install npm -y
RUN ./install.sh
