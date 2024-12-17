# Use an official Maven image to build the app
#FROM maven:3.8.4-jdk-11 as builder
FROM openjdk:11-jre-slim
# Set the working directory
WORKDIR /app
#
## Copy the pom.xml and source code into the container
#COPY pom.xml .
#COPY src ./src

## Run Maven to build the application
#RUN mvn clean install

# Use an openjdk base image to run the app
#FROM openjdk:11-jre-slim

# Copy the jar file from the builder stage
COPY /target/jenkins-test-1.0-SNAPSHOT.jar /app/jenkins-test-1.0-SNAPSHOT.jar

# Expose the application port
EXPOSE 8080

# Run the app
CMD ["java", "-jar", "/app/jenkins-test-1.0-SNAPSHOT.jar"]
