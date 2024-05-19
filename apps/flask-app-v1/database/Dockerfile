# Use the mariadb:latest image as the base image
FROM mariadb:latest

# Copy SQL scripts into the initialization directory
COPY ./db/ /docker-entrypoint-initdb.d/

# Set environment variables
ENV MARIADB_ROOT_PASSWORD=beautiful
ENV MYSQL_DATABASE=frampoldb

# Expose port 3306 for MySQL connections
EXPOSE 3306

