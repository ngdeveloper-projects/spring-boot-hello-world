# Use a base image with Java
FROM openjdk:11-jre-slim

# Copy the application JAR to the container
COPY target/myapp.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]
