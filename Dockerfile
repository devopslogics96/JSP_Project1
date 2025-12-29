FROM ubuntu:18.04

# Remove default apps (optional but recommended)
RUN apt-get update && apt-get install -y openjdk-11-jdk
RUN apt-get install -y wget
RUN mkdir -p /opt/tool/tomcat
WORKDIR /opt/tool
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.tar.gz
RUN tar -xvzf apache-tomcat-9.0.113.tar.gz -C /opt/tool/ && mv ./apache-tomcat-9.0.113/* ./tomcat/
WORKDIR /opt/tool/tomcat/bin
COPY ./app.war /opt/tool/tomcat/webapps
# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["/opt/tool/tomcat/bin/catalina.sh", "run"]

