# Postgres in every environment, with Alembic migrations

The app's own database is Postgres locally and in production, started by Docker Compose, with versioned Alembic migrations. We rejected SQLite for the app database because migrations and SQL behave differently between engines, which would undermine the goal that the project can be deployed reproducibly anywhere by anyone who forks it.

The app database is kept separate from the databases a production Temporal server uses, even when they share one Postgres instance. Local development uses Temporal's own dev server, which keeps its state in SQLite; that is fine because it is not the app's data.
