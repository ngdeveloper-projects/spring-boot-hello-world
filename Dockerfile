# Use a base image with Java 8
FROM openjdk:8-jre-slim

# Copy the application JAR to the container
COPY target/myapp.jar app.jar

  
RUN mkdir -p /usr/share/maven
RUN chmod 777 /usr/share/maven

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]
