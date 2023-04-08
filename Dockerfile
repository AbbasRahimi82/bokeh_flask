FROM python:3.9


RUN apt-get update && apt-get install -y supervisor # Installing supervisord

RUN pip install --upgrade pip
RUN pip install bokeh
RUN pip install xlrd
RUN pip install flask

WORKDIR /app
COPY . /app

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8808
EXPOSE 5100

ENTRYPOINT ["/usr/bin/supervisord"]