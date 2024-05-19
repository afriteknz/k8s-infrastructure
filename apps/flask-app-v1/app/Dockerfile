# syntax=docker/dockerfile:1
FROM python:3.11-alpine
RUN apk update && \
    apk add mariadb-client

# ADD . /app
# Sets the working directory for following COPY and CMD instructions
# Notice we haven’t created a directory by this name - this
# instruction creates a directory with this name if it doesn’t exist
WORKDIR /app

# Update pip
RUN pip install --upgrade pip

# Install any needed packages specified in requirements.txt
# COPY requirements.txt .


# Copy the rest of the source files into the image.
COPY . .
RUN pip install --no-cache-dir -r requirements.txt




# The EXPOSE instruction indicates the ports on which a container # # will listen for connections
# Since Flask apps listen to port 5000  by default, we expose it
EXPOSE 5000

#ENV FLASK_APP=app.py
CMD ["flask", "run", "--host=0.0.0.0"]