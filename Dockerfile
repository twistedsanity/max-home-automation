FROM jlesage/baseimage-gui:debian-12-v4
# FROM jlesage/baseimage-gui:debian-11
#
# Install max-home-automation..
RUN apt-get update && \
    apt-get upgrade -y --force-yes -qq && \
    apt-get install -y \
        ca-certificates
RUN echo "deb [trusted=yes] http://www.dmitry-kazakov.de/distributions bookworm main" >> /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y \
        libpython3.11-dev \
        apt-utils \
        max-home-automation && \
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
COPY startapp.sh /config/startapp.sh
