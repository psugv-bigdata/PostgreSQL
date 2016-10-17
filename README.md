#PostgreSQL
- This is a step by step guide to start a docker container for Postgresql database on Ubuntu 16.04.
- Please ensure that you have the corresponding Dockerfile before following the procedure steps.
- Postgresql will be running on port 4200 inside the docker container and the host port to access it is 4112
- The database backups will be available at /home/docker/DockerImages/PostgreSQL/imagedata/

Steps:
------
1. Ensure that docker is installed on your host machine.
2. Ensure that the Dockerfile is placed in required directory. Usually it is best practice to keep it in your /home.
3. Make sure that the file is spelled correctly i.e "Dockerfile". If file has other name, extension then this doesn't work
4. We need to build the image before it can be deployed in the docker engine. Navigate to directory where the Docker file is placed and run the below command :

- $ docker build .

* Note the image id at displayed by docker at the end of the successful build. It should be something similar to this "6499caea23b6" 

* The container can be deployed/run on the host machine using the below command:
- $ docker run --name postgredbase -d -p 4112:4200 -v /home/docker/DockerImages/PostgreSQL/imagedata/:/PostgresImageData 987a2799c74f

* Please note your image id may be different than 987a2799c74f
* The SQL dump of the database system will be available at /home/docker/DockerImages/PostgreSQL/imagedata/

* -d switch runs image in detached mode and -p forwards the hostport:destination port likewise.
* -v switch is used to mount volumes from host inside the container filesystem

* You can check status of available containers and images using command to see the
- $ docker ps -a

-You should see the name of your container with the associated Container id with current status

* Allow connections to specified port on the host machine using the following command:
- $ sudo ufw allow 4112

* You can now connect to this host machine and work with postgresql database with your client.
