FROM python:3.9-alpine3.13
# FROM python:3.9.11-bullseye

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY . /backend
COPY ./scripts /scripts

WORKDIR /backend

RUN python -m venv /py 
RUN /py/bin/pip install --upgrade pip 
RUN apk add --update --no-cache --virtual python3-dev build-base linux-headers
RUN /py/bin/pip install -r /requirements.txt 
RUN adduser --disabled-password --no-create-home django
RUN mkdir -p /vol/django_static/static
RUN mkdir -p /vol/django_static/media
RUN chown -R django:django /vol
RUN chmod -R 755 /vol
RUN chmod -R +x /scripts


ENV PATH="/scripts:/py/bin:$PATH"

USER django