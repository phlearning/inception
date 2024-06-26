# ft_inception

## Table of Contents

- [ft\_inception](#ft_inception)
  - [Table of Contents](#table-of-contents)
  - [About ](#about-)
    - [What is docker ?](#what-is-docker-)
    - [Setup Details](#setup-details)
  - [Getting Started ](#getting-started-)
    - [Prerequisites](#prerequisites)
    - [Installing](#installing)
  - [Usage ](#usage-)
    - [Make commands](#make-commands)
  - [Acknowledgements ](#acknowledgements-)

## About <a name = "about"></a>

This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine. **We cannot pull ready-made Docker images**

> *"You also have to write your own Dockerfiles, one per service. The Dockerfiles must be called in your docker-compose.yml by your Makefile. It means you have to build yourself the Docker images of your project. It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub(Alpine/Debian being excluded from this rule)."* - from the subject

###  What is docker ?

- Docker is a platform that enables developers to create, deploy, and run applications in isolated environments called containers.
- Containers package an application and its dependencies, ensuring consistency across different development and production environments.
- By using Docker, developers can easily manage application components, streamline workflows, and improve scalability and performance through efficient resource utilization.

### Setup Details

- NGINX Container: Must support TLSv1.2 or TLSv1.3 only.
- WordPress Container: Includes WordPress and php-fpm, configured and installed (without NGINX).
- MariaDB Container: MariaDB only (without NGINX).
- Volumes:
    - One for the WordPress database.
    - One for the WordPress website files.
- Networking: Create a Docker network to connect all containers.
- Container Management: Containers must restart automatically in case of a crash.

> PS: You should never actually put an environment file (.env) in public or in your github. As it is usually filled with your api keys or access information.


## Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Docker
  * Go to https://docs.docker.com/get-docker/ and follow the instructions corresponding to your OS.
* Make (to launch Makefile)
* Either Mac or Linux (if not then there is a need to change the home path in the makefile)

### Installing

1. Clone the repo
    ```
    git clone https://github.com/phlearning/inception.git
    ```
2. Download docker and docker compose if needed (https://docs.docker.com/get-docker/)
3. Adjust the Makefile
    - Change the login to your computer's account username

        ```
        To get your login for the makefile:
            `echo ${HOME}`

        You should get something like this:
            `/home/pvong` - the pvong here is my login
        ```

4. Change the `.env` file to your liking
   - Note: If you want to run locally change the domains to localhost in the .env file. If not then adjust your `/etc/hosts`
   - If you are in a Virtual Machine you can safely adjust the `/etc/hosts` file to reroute `127.0.0.1` to your domain specified in the .env file.

5. Launch with `make` in the cli while inside the project folder.

## Usage <a name = "usage"></a>

   1. Use `make` to launch the application
   2. Open your web browser and navigate to `https://localhost:443/` or the domain specified. You should now see a wordpress website.
   3. Adjust the `.env` file if you wish to change the user and admin access.

### Make commands
 - `make`: Create the folders, build the images and run the containers.
 - `make run-detached`: Run the containers while still accessing the terminal.
 - `make down`: To stop and remove the containers.
 - `make stop`: To stop the containers, use `make run` to rerun if needed.
 - `make clear`: To delete any containers, images, docker networks and volumes.
 - `make clean`: To prune any containers and images not in use or named after the given var NAME in the makefile (inception)
 - `make fclean`: Similar to make clean but also clean the volumes.
 - `make delete-volumes`: To clean only the volumes.
 - `make status`: To check the status of the containers, images, volumes and network.


## Acknowledgements <a name = "acknowledgement"></a>
 - Help throughout the whole project:
   - [FXC-ai](https://github.com/FXC-ai/Inception)'s help (helped in person 🏆)
   - [Killian-Morin](https://github.com/Killian-Morin/42-Inception)'s help (do take a look at their readme for the sources)
   - https://tuto.grademe.fr/inception/ (🌟 recommend to start with this)
   - https://github.com/vbachele/Inception (🐐 really good)

 - Docker:
   - https://docs.docker.com/
   - https://www.youtube.com/watch?v=gAkwW2tuIqE

 - Nginx:
   - https://docs.nginx.com/
   - http://nginx.org/en/docs/beginners_guide.html

 - MariaDB:
   - https://mariadb.com/kb/en/training-tutorials/

 - Wordpress:
   - Refer to https://github.com/vbachele/Inception