# 42_inception

## Project Overview
This project is a System Administration related exercise, part of the 42 school curriculum. It focuses on Docker containerization and system configuration.

## Description
42_inception is designed to deepen understanding of system administration concepts, particularly in the areas of:
- Docker and containerization
- Web server configuration
- Database management
- WordPress setup

## Project Structure
The project consists of several key components:
- Docker configuration files
- NGINX web server setup
- MariaDB database configuration
- WordPress installation and configuration

## Services

### NGINX
- Purpose: Web server and reverse proxy
- Configuration: Custom SSL certificate, listens on port 443
- Setup:
  1. Uses Debian Buster as base image
  2. Installs NGINX and OpenSSL
  3. Generates a self-signed SSL certificate
  4. Configures NGINX to use SSL and proxy PHP requests to WordPress

### MariaDB
- Purpose: Database server for WordPress
- Configuration: Custom user and database setup
- Setup:
  1. Uses Debian Buster as base image
  2. Installs MariaDB server
  3. Runs a script to initialize the database, create users, and set permissions

### WordPress
- Purpose: Content Management System
- Configuration: PHP-FPM, wp-cli for setup
- Setup:
  1. Uses Debian Buster as base image
  2. Installs PHP-FPM, MySQL client, and other dependencies
  3. Installs wp-cli for WordPress management
  4. Runs a script to download and configure WordPress

## Getting Started
To set up and run this project:
1. Clone the repository
2. Ensure Docker is installed on your system
3. Configure the necessary environment variables in a `.env` file (not tracked by Git)
4. Use the provided Makefile commands to manage the project:
   - `make up`: Start the containers
   - `make down`: Stop and remove the containers
   - `make stop`: Stop the containers
   - `make start`: Start stopped containers
   - `make status`: Show running containers
   - `make prune`: Remove all unused Docker resources
   - `make re`: Rebuild and restart the project

## Environment Variables
Create a `.env` file in the `srcs` directory with the following variables:
- `MYSQL_DATABASE`: Name of the WordPress database
- `DB_ROOT_PASS`: MariaDB root password
- `DB_USER`: WordPress database user
- `DB_PASS`: WordPress database password
- `DB_HOST`: Database hostname (usually 'mariadb')
- `WP_TITLE`: WordPress site title
- `WP_ADMN_USR`: WordPress admin username
- `WP_ADMN_PASS`: WordPress admin password
- `WP_ADMN_MAIL`: WordPress admin email
- `WP_USER`: Additional WordPress user
- `WP_MAIL`: Additional user's email
- `WP_PASS`: Additional user's password

## Author
Hasnaa Et-taleby

## License
This project is part of the 42 school curriculum and is subject to its academic policies.
