FROM debian:12.5-slim
# FROM jlesage/baseimage-gui:debian-11
#
# Install max-home-automation..
RUN apt-get update && \
    apt-get upgrade -y --force-yes -qq && \
    apt-get install -y \
        ca-certificates \
RUN echo "deb [trusted=yes] http://www.dmitry-kazakov.de/distributions bookworm main" >> /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y \
        libpython3.11-dev \
        apt-utils \
        max-home-automation_4.9 && \
#
# cleanup.
  apt-get update && \
  apt-get upgrade -y --force-yes -qq && \
  apt-get purge --auto-remove -y && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*
#
# Set the name of the application.
ENV APP_NAME="MAX! Home Automation"
#
# Copy the start script.
COPY startapp.sh /startapp.sh
