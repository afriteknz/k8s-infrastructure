# Use the mariadb:latest image as the base image
FROM mariadb:latest

COPY  ./db/ /docker-entrypoint-initdb.d/
# Expose port 3306 for MySQL connections

ARG MYSQL_DATABASE
ARG MARIADB_ROOT_PASSWORD
ENV MARIADB_ROOT_PASSWORD = "beautiful"
ENV MYSQL_DATABASE = "frampoldb"

EXPOSE 3306
