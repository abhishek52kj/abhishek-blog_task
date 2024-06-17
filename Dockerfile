# Use a base image with OpenJDK
FROM openjdk:11-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built jar file
COPY target/blog-application.jar blog-application.jar

# Command to run the jar file
ENTRYPOINT ["java", "-jar", "blog-application.jar"]
