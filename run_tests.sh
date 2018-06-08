#!/usr/bin/env bash

set -e

# Pass the first argument as python tag and second argument as django version
python_version=${1:-'3.6.5-alpine3.7'}
django_version=${2:-'2.0.6'}
supported_db_host=(scylla cassandra)


echo "Testing with"
echo "python version: ${python_version}"
echo "django version: ${django_version}"

# '2.7.15-alpine3.7'
# '1.11.1'
if [[ ${python_version} =~ ^2. ]] && [[ ${django_version} =~ ^2. ]]; then
    echo "django version 2 not supported in python 3 skipping this test"
else
    docker-compose build \
    --build-arg PYTHON_IMAGE_TAG=${python_version} \
    --build-arg DJANGO_VERSION=${django_version} app

    for host in "${supported_db_host[@]}"
    do
        sudo find . -name \*.pyc -delete
        echo "db host: ${host}"
        docker-compose run -e SCYLLA_HOST=${host} app python manage.py test
    done
fi
