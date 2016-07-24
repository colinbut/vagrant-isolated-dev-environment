#!/usr/bin/env bash

# upating apt-get first
sudo apt-get update

echo "Installing Apache"
sudo apt-get install -y apache2

echo "Installing Tomcat"
sudo apt-get install -y tomcat7
echo "Installing Tomcat docs"
sudo apt-get install -y tomcat7-docs
echo "Installing Tomcat administration web apps"
sudo apt-get install -y tomcat7-admin
echo "Installing Tomcat examples"
sudo apt-get install -y tomcat7-examples

echo "Installing Git"
sudo apt-get install -y git

echo "Installing Java 7"
sudo apt-get install -y software-properties-common python-software-properties
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java7-installer
echo "Setting environment variables for Java 7"
sudo apt-get install -y oracle-java7-set-default