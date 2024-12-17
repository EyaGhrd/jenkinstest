FROM openjdk:8-jre-slim

COPY /target/jenkins-test-1.0-SNAPSHOT.jar /jenkins-test-1.0-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "/jenkins-test-1.0-SNAPSHOT.jar"]