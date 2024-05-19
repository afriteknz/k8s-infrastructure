# Pulling the base image for the container
FROM python:3.9-alpine3.15

# Creat and enter to this folder:
WORKDIR /app


# Upgrade PIP Package to Latest Version
RUN pip install --upgrade pip

COPY . .

# installing the python packages for the app
RUN pip install -r requirements.txt
# Copying the app folder to the container

# The EXPOSE instruction indicates the ports on which a container # # will listen for connections
# Since Flask apps listen to port 5000  by default, we expose it
EXPOSE 5000

#ENV FLASK_APP=app.py
CMD ["flask", "run", "--host=0.0.0.0"]