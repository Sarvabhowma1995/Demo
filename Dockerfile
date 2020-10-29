FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/flipkart-1.0-SNAPSHOT.jar $PROJECT_HOME/flipkart.jar

WORKDIR $PROJECT_HOME

CMD ["java" ,"-jar","./flipkart.jar"]