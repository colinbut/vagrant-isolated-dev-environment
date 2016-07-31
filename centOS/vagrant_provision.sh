#!/usr/bin/env bash

# upating yum first
sudo yum update

#Apache Http Web Server
if [ ! -f /usr/lib/apache2/mpm-worker/apache2 ];
then
	echo "Installing Apache"
	sudo yum install -y apache2
else
	echo "Apache already installed - skipping"
fi

#Tomcat
if [ ! -f /etc/init.d/tomcat7 ];
then
	echo "Installing Tomcat"
	sudo yum install -y tomcat7
	echo "Installing Tomcat docs"
	sudo yum install -y tomcat7-docs
	echo "Installing Tomcat administration web apps"
	sudo yum install -y tomcat7-admin
	echo "Installing Tomcat examples"
	sudo yum install -y tomcat7-examples
else
	echo "Tomcat 7 already installed - skipping"
fi


#Java
if [ ! -f /usr/lib/jvm/java-7-oracle/bin/java ];
then
	echo "Installing Java 7"
	sudo yum install -y software-properties-common python-software-properties
	echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
	sudo add-apt-repository ppa:webupd8team/java -y
	sudo yum update
	sudo yum install oracle-java7-installer
	echo "Setting environment variables for Java 7"
	sudo yum install -y oracle-java7-set-default
else
	echo "Java 7 already installed - skipping"
fi

#Maven
if [ ! -f /usr/share/maven/bin/mvn ];
then
	echo "Installing Maven"
	sudo yum install -y maven
else
	echo "Maven already installed - skipping"
fi

#Git
if [ ! -f /usr/bin/git ];
then
	echo "Installing Git"
	sudo yum install -y git
else
	echo "Git already installed - skipping"
fi

#NGINX
if [ ! -f /usr/sbin/nginx ];
then
	echo "Installing NGINX"
	sudo yum install -y nginx
else
	echo "NGINX already installed - skipping"
fi

#MySQL Server
if [ ! -f /usr/sbin/mysqld ];
then
	echo "Installing MySQL Server"
	sudo yum install -y debconf-utils
	debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
	debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
	sudo yum install -y mysql-server
else
	echo "Mysql server already installed - skipping"
fi

