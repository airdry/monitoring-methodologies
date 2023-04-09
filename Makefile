.PHONY: depend clean
start:
	docker compose up -d --force-recreate

clean:
	docker compose down -v