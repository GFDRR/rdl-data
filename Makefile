start:
	rm -f sql/dump.sql
	cat sql/create-users.sql >> sql/dump.sql
	cat sql/00-common-schema.sql >> sql/dump.sql
	cat sql/02-hazard-schema.sql >> sql/dump.sql
	cat sql/03-ged4all-schema.sql >> sql/dump.sql
	cat sql/04-loss-schema.sql >> sql/dump.sql
	cat sql/05-mover-schema.sql >> sql/dump.sql
	cat sql/06-permissions.sql >> sql/dump.sql
	docker-compose up
.PHONY: start

stop:
	docker-compose stop
	rm -f sql/dump.sql
.PHONY: stop
