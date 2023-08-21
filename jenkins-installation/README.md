# jenkins-installation
The repo contains the jenkins installation and removal scripts on a docker container.

# make sure you add executable permission to the scripts
sudo chmod +x *.sh

# jenkins-up.sh
Pull the jenkins/jenkins:lts image from the docker hub and create a container of that.

# jenkins-down.sh
This script will delete jenkins container and it's volume.

# jenkins-pass.sh
This script shows the initial admin password for jenkins web console.