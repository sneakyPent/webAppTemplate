#!/bin/sh

echo "Collect static files"
python manage.py collectstatic --no-input
# python manage.py makemigrations
python manage.py migrate
python manage.py create_default_user
echo "Starting server"
python manage.py runserver 0.0.0.0:8000
