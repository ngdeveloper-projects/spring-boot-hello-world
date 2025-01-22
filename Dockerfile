# Use a base image with Java 8
FROM openjdk:8-jre-slim

# Copy the application JAR to the container
COPY target/myapp.jar app.jar

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
  
RUN mkdir -p /usr/share/maven
RUN chmod 777 /usr/share/maven

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]
