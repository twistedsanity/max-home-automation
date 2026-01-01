FROM jlesage/baseimage-gui:ubuntu-24.04-v4
# FROM jlesage/baseimage-gui:debian-11
#
# Install max-home-automation..
RUN apt-get update && \
    apt-get upgrade -y -qq && \
    # apt-get upgrade -y --force-yes -qq && \
    apt-get install -y \
        ca-certificates
RUN echo "deb [trusted=yes] http://www.dmitry-kazakov.de/distributions trixie main" >> /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y \
        apt-utils \
        libpython3.11-dev \
        max-home-automation && \
#
# cleanup.
  apt-get update && \
  apt-get upgrade -y -qq && \
  #apt-get upgrade -y --force-yes -qq && \
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
RUN chmod +x /startapp.sh
