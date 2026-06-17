# Stage 1: Build
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app

# Cache dependencies layer separately from source code
# so `mvn package` doesn't re-download deps on every source change
COPY pom.xml .
RUN mvn dependency:go-offline -q

# REST API only — the frontend lives in a separate Next.js repo, so this is a
# pure backend build that produces the WAR.
COPY src ./src
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