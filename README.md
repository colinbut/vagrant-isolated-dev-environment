## An opinionated 'Isolated' Development Environment using Vagrant

Automatically constructs an isolated development environment that automatically provisions software tools required for developing a software application.

This project samples a very respectable development environment with common software.

The benefits of an 'isolated' development environment is many:

1. No more of the classic __"Only works on my machine"__ problem  
2. Easily spin up a full dev environment just by one command, likewise to teardown  
3. The environment would be very similar/pretty-much identical to what it would be like in production  
4. Every developer in the software team/works on same project can develop using the same infrastructure  


### Provisioning

Vagrant backed development environment uses Virtual Machine on VirtualBox platform.
Contains following software installed:

- Java 7
- Git & GitList as a Repository Viewer
- Maven
- MySQL
- NGINX
- Apache Tomcat7
- Apache Web Server

### note
Do note that this is not a full complete example of a working dev environment because every project is different with not the same software required. This is just an example 'template' that serves a ready made initial dev environment which one can use as a starting point to configure and modify where necessary on top of.
