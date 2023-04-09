.PHONY: depend clean

build-app:
	cd demoapp && docker build --target app -t app .

build-load:
	cd demoapp && docker build --target load -t load .

start:
	docker compose up -d --force-recreate

reload:
	docker compose up -d --force-recreate load
	
clean:
	docker compose down -v