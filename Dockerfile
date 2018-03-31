FROM python:3

RUN pip3 install gunicorn django pytz
ADD . /code
WORKDIR /code/mysite/
CMD ["python manage.py runserver"]
