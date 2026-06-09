#!/usr/bin/env sh
set -e

# 1) Default to "db" and "3306" if not set in the env
DB_HOST=${DB_HOST:-db}
DB_PORT=${DB_PORT:-3306}

# 2) Wait for MySQL to accept TCP connections
echo "⏳ Waiting for MySQL at $DB_HOST:$DB_PORT…"
until nc -z "$DB_HOST" "$DB_PORT"; do
  sleep 1
done

# 3) Run migrations once the DB is live
echo "✅ MySQL is up—running migrations…"
python manage.py migrate

# 4) Start Django
echo "🚀 Starting Django on 0.0.0.0:8000"
exec python manage.py runserver 0.0.0.0:8000
