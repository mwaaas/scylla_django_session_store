ARG PYTHON_IMAGE_TAG=3.6.5-alpine3.7
FROM python:${PYTHON_IMAGE_TAG}

RUN mkdir -p /usr/src/app \
    && apk update \
    && apk add bash curl git

WORKDIR /usr/src/app

COPY . .

ARG DJANGO_VERSION
ENV DJANGO_VERSION ${DJANGO_VERSION:-2.0.6}
ENV CODECOV_TOKEN=8eec66fd-ce42-4749-a2ca-eaf5df39783e
ENV CODACY_PROJECT_TOKEN=f3ee4659450046bfa67b0d8bdd2cc42e

RUN pip install --no-cache-dir -r requiments.txt \
    && pip install django==${DJANGO_VERSION}

