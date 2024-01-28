FROM ubuntu:latest
FROM python:3.9

RUN apt-get update -y && \
    apt-get install -y python3-pip

WORKDIR /app
COPY ./requirements.txt /app/requirements.txt

RUN pip3 install -r requirements.txt
COPY . /app


EXPOSE 5000
RUN python3 ./code_model_training/train.py

CMD python3 ./app.py --host 0.0.0.0
