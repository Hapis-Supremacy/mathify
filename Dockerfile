# Stage 1: Build
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

# Stage 2: Run
FROM tomcat:10-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/mathify.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080