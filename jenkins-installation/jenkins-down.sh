#!/bin/bash

sudo docker rm -f $(docker ps -a | grep "jenkins/jenkins" | cut -d' ' -f1)
sudo docker volume rm jenkins_home