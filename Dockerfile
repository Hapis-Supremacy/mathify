# Stage 1: Build
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app

# Cache dependencies layer separately from source code
# so `mvn package` doesn't re-download deps on every source change
COPY pom.xml .
RUN mvn dependency:go-offline -q

COPY src ./src
# Frontend sources (Vite project). The frontend-maven-plugin builds these during
# `mvn package` and emits the bundle into src/main/webapp/assets/app.
COPY frontend ./frontend
RUN mvn package -DskipTests

# Stage 2: Run
FROM quay.io/wildfly/wildfly:31.0.1.Final-jdk17
COPY --from=builder /app/target/mathify.war /opt/jboss/wildfly/standalone/deployments/ROOT.war
# WildFly runs as jboss user, ensure permissions
USER root
RUN chown jboss:jboss /opt/jboss/wildfly/standalone/deployments/ROOT.war
USER jboss
EXPOSE 8080
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]