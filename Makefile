publish:
	docker-compose build app
	docker-compose run --no-deps app  python setup.py sdist upload