FROM python:3.10.17-slim-bullseye

RUN apt -y update && apt install -y gcc default-libmysqlclient-dev python3-dev pkg-config && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /opt
WORKDIR /opt

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 9050
CMD [ "python3" , "app/manage.py" , "runserver" , "0.0.0.0:9050" ]