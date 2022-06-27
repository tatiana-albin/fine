FROM python:3

WORKDIR /usr/src/app

RUN pip install --no-cache-dir Flask

COPY src/flask_entrypoint.py ./flask_entrypoint.py

EXPOSE 5000 

CMD [ "python", "./flask_entrypoint.py" ]