FROM ubuntu:14.04

WORKDIR /wsgi

RUN apt-get update \
    && apt-get install -y devscripts apache2-dev build-essential python-dev reprepro gnupg \
    && apt-get clean -y

COPY ./build ./build
COPY ./mod-wsgi ./mod-wsgi
COPY ./debian/conf ./debian/conf

RUN ./build

CMD [ "/bin/bash" ]
