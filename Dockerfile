ARG PYTHON_IMAGE_TAG=3.6.5-alpine3.7
FROM python:${PYTHON_IMAGE_TAG}

RUN mkdir -p /usr/src/app \
    && apk update \
    && apk add bash curl

WORKDIR /usr/src/app

COPY . .

ARG DJANGO_VERSION
ENV DJANGO_VERSION ${DJANGO_VERSION:-2.0.6}

RUN pip install --no-cache-dir -r requiments.txt \
    && pip install django==${DJANGO_VERSION}

