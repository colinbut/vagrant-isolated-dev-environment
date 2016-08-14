#!/usr/bin/env bash

# upating apt-get first
sudo apt-get update

#Java
if [ ! -f /usr/lib/jvm/java-8-oracle/bin/java ];
then
	echo "Installing Java 8"
	sudo apt-get install -y software-properties-common python-software-properties
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
	sudo add-apt-repository ppa:webupd8team/java -y
	sudo apt-get update
	sudo apt-get install oracle-java8-installer
	echo "Setting environment variables for Java 8"
	sudo apt-get install -y oracle-java8-set-default
else
	echo "Java 8 already installed - skipping"
fi

#Maven
if [ ! -f /usr/share/maven/bin/mvn ];
then
	echo "Installing Maven"
	sudo apt-get install -y maven
else
	echo "Maven already installed - skipping"
fi

#Git
if [ ! -f /usr/bin/git ];
then
	echo "Installing Git"
	sudo apt-get install -y git
else
	echo "Git already installed - skipping"
fi

#Apache Http Web Server
if [ ! -f /usr/lib/apache2/mpm-worker/apache2 ];
then
	echo "Installing Apache"
	sudo apt-get install -y apache2
else
	echo "Apache already installed - skipping"
fi

#Tomcat
if [ ! -f /etc/init.d/tomcat7 ];
then
	echo "Installing Tomcat"
	sudo apt-get install -y tomcat7
	echo "Installing Tomcat docs"
	sudo apt-get install -y tomcat7-docs
	echo "Installing Tomcat administration web apps"
	sudo apt-get install -y tomcat7-admin
	echo "Installing Tomcat examples"
	sudo apt-get install -y tomcat7-examples
else
	echo "Tomcat 7 already installed - skipping"
fi

#NGINX
if [ ! -f /usr/sbin/nginx ];
then
	echo "Installing NGINX"
	sudo apt-get install -y nginx
	echo "Starting NGINX"
	sudo /etc/init.d/nginx start
else
	echo "NGINX already installed - skipping"
fi

#MySQL Server
if [ ! -f /usr/sbin/mysqld ];
then
	echo "Installing MySQL Server"
	sudo apt-get install -y debconf-utils
	debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
	debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
	sudo apt-get install -y mysql-server
else
	echo "Mysql server already installed - skipping"
fi

#SonarQube Server
echo "Downloading Sonar"
wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.5.zip

echo "Unpacking Sonar"
sudo unzip sonarqube-5.5.zip

echo "Installing Sonar"
sudo mv -v sonarqube-5.5 /opt/sonar

echo "Starting Sonar Server"
sudo /opt/sonar/bin/linux-x86-64/sonar.sh start

#Sonar Runner
cd /opt
sudo wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip
sudo unzip sonar-runner-dist-2.4.zip
sudo ln -s sonar-runner-2.4 sonar-runner


#PHP 
# (dependency requirement for GitList)
echo "Installing PHP"
sudo apt-get install -y php5

#GitList
# (A Git Repository Viewer)
echo "Downloading GitList"
sudo wget https://s3.amazonaws.com/gitlist/gitlist-0.5.0.tar.gz
echo "Extracting GitList"
sudo tar -xvzf gitlist-0.5.0.tar.gz /var/www/
sudo rm gitlist-0.5.0.tar.gz

cd /var/www/gitlist
sudo mkdir cache
sudo chmod 777 cache

sed 's/\\/home\\/git\\/repositories\\//\\/var\\/www\\/projects/' config.ini-example > config.ini

sudo service apache2 restart
sudo a2enmod rewrite

# At this point GitList should be installed 
# It is just a matter of configuration for use

# 1. Need to change /var/www/'s AllowOverride from None to All in the default Apache website config file
# 2. Restart Apache (sudo /etc/init.d/apache2 restart)




