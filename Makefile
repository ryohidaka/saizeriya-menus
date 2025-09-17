DB_NAME=db/saizeriya.db
SQL_NAME=db/saizeriya.sql

restore:
	rm $(DB_NAME)
	sqlite3 $(DB_NAME) < $(SQL_NAME)

dump:
	sqlite3 $(DB_NAME) ".output $(SQL_NAME)" ".dump"
