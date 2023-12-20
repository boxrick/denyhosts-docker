FROM python:2.7-alpine3.11

LABEL denyhosts_version="3.1" architecture="amd64"

RUN apk add --no-cache git  \
    && pip install --no-cache-dir ipaddr requests \
    && git clone --single-branch --branch "master" https://github.com/denyhosts/denyhosts.git \
    && apk del git

WORKDIR /denyhosts
RUN python setup.py install \
    && rm -r /denyhosts

COPY denyhosts.conf /etc/denyhosts.conf

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]