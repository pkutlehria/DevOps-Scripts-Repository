#!/bin/bash

# Step 1: Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run the script as root or use sudo."
    exit 1
fi

# Step 2: Installation of Java
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
java -version

# Step 3: Installation of Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

# Step 4: Enable and Start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Step 5: Check Jenkins status
sudo systemctl status jenkins

