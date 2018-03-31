FROM python:3

RUN pip3 install gunicorn django pytz
ADD . /code
CMD ["/usr/local/bin/python3 /code/mysite/manage.py runserver"]
