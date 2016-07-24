#!/usr/bin/env bash

# upating apt-get first
sudo apt-get update

echo "Installing Apache"
sudo apt-get install -y apache2

echo "Installing Tomcat"
sudo apt-get install -y tomcat7

echo "Installing Tomcat docs"
sudo apt-get install -y tomcat7-docs