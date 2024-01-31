# Stage 1: Build the application
FROM gradle:7.5.1-jdk17-alpine AS build
WORKDIR /home/gradle/src
COPY --chown=gradle:gradle . /home/gradle/src
RUN gradle build --no-daemon

# Stage 2: Create the Docker final image
FROM openjdk:17-alpine
EXPOSE 8080
VOLUME /tmp
ARG JAR_FILE=/home/gradle/src/build/libs/onlineorder-0.0.1-SNAPSHOT.jar
COPY --from=build ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "-Dserver.port=$PORT", "/app.jar"]