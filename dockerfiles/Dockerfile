# Base image
FROM rocker/verse:4.4.0

# Change repo
RUN sed -i 's@archive.ubuntu.com@jp.archive.ubuntu.com@g' /etc/apt/sources.list

RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  \
    tzdata
ENV TZ=Asia/Tokyo

# Set git config
RUN git config --global user.email "20899973+hkrkizum@users.noreply.github.com"
RUN git config --global user.name "Hikaru Koizumi@docker image"
