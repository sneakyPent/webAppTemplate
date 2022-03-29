#!/bin/sh

echo "Collect static files"
python manage.py collectstatic --no-input
# python manage.py makemigrations
python manage.py migrate --no-input
# python manage.py create_default_user
echo "Starting server"
gunicorn backend.wsgi -b 0.0.0.0:8000
