FROM jlesage/baseimage-gui:debian-10

# Install max-home-automation..
COPY sources.list.d/* /etc/apt/sources.list.d/
RUN apt-get update && apt-get install -y \
    libpython3.7-dev \
    max-home-automation

# Set the name of the application.
ENV APP_NAME="MAX! Home Automation"

# Copy the start script.
COPY startapp.sh /startapp.sh
