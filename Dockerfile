FROM python:3.10.17-slim-bullseye

RUN apt -y update && apt install -y gcc default-libmysqlclient-dev python3-dev pkg-config && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /opt
WORKDIR /opt

RUN python3 -m venv vir
RUN /bin/sh -c source vir/bin/activate

RUN pip install --no-cache-dir -r requirements.txt


EXPOSE 9000
CMD [ "python3" , "app/manage.py" , "runserver" , "0.0.0.0:9000"]