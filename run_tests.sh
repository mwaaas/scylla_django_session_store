#!/usr/bin/env bash

set -e

python_tags=('3.6.5-alpine3.7' '2.7.15-alpine3.7')
djangoVersions=('2.0.6' '1.11.1')
supported_db_host=(scylla cassandra)

# test different python versions
for python_version in "${python_tags[@]}"
do
  # test django versions
  for django_version in "${djangoVersions[@]}"
  do
    echo "Testing with"
    echo "python version: ${python_version}"
    echo "django version: ${django_version}"
    docker-compose build \
        --build-arg PYTHON_IMAGE_TAG=${python_version} \
        --build-arg DJANGO_VERSION=${django_version} app
    for host in "${supported_db_host[@]}"
    do
        find . -name \*.pyc -delete
        echo "db host: ${host}"
        docker-compose run -e SCYLLA_HOST=${host} app python manage.py test
    done
  done
done
