FROM eclipse-temurin:21.0.4_7-jdk-alpine@sha256:37abc85b7046a2301ce60e76a28ab07a339e864fd9376c4b44b64b07c44a52d6 AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.4_7-jre-alpine@sha256:8cc1202a100e72f6e91bf05ab274b373a5def789ab6d9e3e293a61236662ac27

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
