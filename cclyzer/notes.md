Docker Notes
============

* To build `docker` image from `Dockerfile`:

        docker build -t gbalats/cclyzer .

* To run `docker`:

        docker run --shm-size=3g --rm -ti gbalats/cclyzer

* Other commands:

        docker images
        docker ps -a
        docker save gbalats/cclyzer:latest > cclyzer.tar
        docker load -i cclyzer.tar
        docker stop 3c93fdbedc98
        docker start -a 3c93fdbedc98
        docker commit 3c93fdbedc98 gbalats/cclyzer_post_setup

* To remove image:

        docker rmi *image name*

* To remove containers:

        docker rm $(docker ps -aq)
