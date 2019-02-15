FROM ubuntu:18.04

#  apt-get -y upgrade && \

RUN \
  apt-get update && \
  apt-get install -y \
    python \
    python-pip \
  && (apt-get clean; rm -rf /var/lib/apt/lists/*)

RUN pip install --no-cache-dir --ignore-installed --upgrade \
    devpi-server \
    devpi-client \
    devpi-web

EXPOSE 3141
COPY entrypoint.sh /
VOLUME /data
ENV HOME /data
WORKDIR /data
ENTRYPOINT ["/entrypoint.sh"]
