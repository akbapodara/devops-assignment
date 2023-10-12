FROM wordpress:latest

LABEL maintainer="anand"

ENV WORDPRESS_DB_HOST=db
ENV WORDPRESS_DB_USER=anand_bapodara
ENV WORDPRESS_DB_PASSWORD=devopsproject
ENV WORDPRESS_DB_NAME=devops_project
