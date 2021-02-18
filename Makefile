build-run: 
	docker-compose stop
	docker-compose build
	docker-compose up -d

logs-f:
	docker-compose logs -f --tail 25 | grep flask-app

logs-worker:
	docker-compose logs -f --tail 250 | grep flask-worker

down:
	docker-compose down --remove-orphans

app:
	# build and run Docker commands would go here instead of docker-compose

