# Pull base image 
From tomcat:8-jre8 

# Copy the war file into container
COPY webapp/target/webapp.war /usr/local/tomcat/webapps

