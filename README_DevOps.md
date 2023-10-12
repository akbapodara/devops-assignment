
# Dockerizing Wordpress with Dockerfile, Docker compose and Database Optimization

This project is demonstrates how to Dockerize a WordPress application and optimize the database for improved performance.

In this project uses Docker Compose for WordPress application and a MySQL database. In that i created a dockerfile for my Wordpress application and Docker compose file for orchestrate this application and it includes the sevices for mariadb or mysql and also i have configured the environment variables for security purpose. 

Firstly in our system or virtual machine docker and docker compose are needed and installed.So, for building this project I have created a directory named DevOps_Project, in that directory i have write docker-compose.yml file for managing the services,networking and in wordpress directory there is one Dockerfile for our wordpress application


## Project Structure:

I have an root directory and in that i have all the files

```bash
  /DevOps_Project
     /wordpress
        Dockerfile
  docker-compose.yml
  README1.md
  wp-config.php      
```
    
## Docker Compose

Docker Compose for WordPress application and a MySQL database

```bash
  version: '3.9'
services:
  wordpress:
    build:
      context: ./wordpress
    ports:
      - "8000:80"
    depends_on:
      - db
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: anand_bapodara
      WORDPRESS_DB_PASSWORD: devopsproject
      WORDPRESS_DB_NAME: devops_project
  db:
    image: mysql:latest
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: devopsproject
      MYSQL_DATABASE: devops_project

```


## DockerFile for Wordpress

Dockerfile for worpres application in wordpress directory

```bash
FROM wordpress:latest

LABEL maintainer="anand"

ENV WORDPRESS_DB_HOST=db
ENV WORDPRESS_DB_USER=anand_bapodara
ENV WORDPRESS_DB_PASSWORD=devopsproject
ENV WORDPRESS_DB_NAME=devops_project
```


## Cofiguration Files

```javascript
define('DB_HOST', 'db');
define('DB_USER', 'anand_bapodara');
define('DB_PASSWORD', 'devopsproject');
define('DB_NAME', 'devops_project');

```


## Optimizations steps for database performance

Identify frequently used queries in columns in your database tables.Determine which columns should be indexed for optimal performance. Not all columns need to be indexed. Indexing too many columns can actually slow down your database. You should only index columns that are frequentl queried

identified the tables that require indexing, we can proceed to create the necessary indexes using SQL commands. Like,

CREATE INDEX anand_bapodata ON fifty_tech (devops_tech)

Identify and optimize slow or inefficient queries. Review wordpress application's database queries to ensure they're well-structured and retrieve only the necessary data. Optimize queries by:
Removing unnecessary queries.
Using the EXPLAIN command to analyze query execution plans and identify improvement.
Document the queries and the rationale behind each optimization

Utilize tools like Redis or Memcached to establish an object cache that stores frequently accessed data in memory and also When a user requests a specific page, store the rendered HTML output in a cache. like in wordpress web application by implementing page caching, we can store the rendered HTML of the homepage in a cache. This means that when multiple users access the homepage, the cached HTML is served quickly, reducing the load on the database and improving page load times.


## Challenges ::

1.When i run docker-compose up command it gives an error of service.db.environment, like
ERROR: The Compose file './docker-compose.yml' is invalid because:
services.db.environment contains an invalid type, it should be an object, or an array

Because in yml file i used "=" instead of ":", but i solve this errors 

2.The another error was in port mapping i mapped the port to 8080 and it gives me the error because jenkins is installed in my machine and it is by default run on 8080 port so i change this port 8000 and mapped to container port 80

3.The 3rd error is database connection error "Error establishing a database connection" when attempting to access the WordPress site.This was likely due to misconfiguration of the database-related environment variables


## Additional Notes

During the building of this project, I identified some best practices and security recommendations for the ".env" and "wp-config.php" files

This .env file privides secure storage for ensure that the `.env` file is kept secure and not committed to version control. It contains sensitive information like database passwords for database and root passwords, choose strong, unique passwords to enhance security.Regularly review and update the information in the ".env" file as needed, especially when modifying database credentials.Config.php provides additional security settings that can be configured0 in "wp-config.php".

