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
