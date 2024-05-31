FROM openjdk:8
EXPOSE 8080
ADD target/my-app-1.0.jar my-app-1.0.jar
ENTRYPOINT ["java","-jar","/my-app-1.0.jar"]