FROM eclipse-temurin:25-jdk-alpine-3.21@sha256:55cb381e0575555b6969c917ac06b9b1a495edf1a546b8a8a7298fa4f8157ee4 AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:25-jre-alpine-3.21@sha256:9723f527a9d58c6675859fed206b8d41e3dc6bd0a894d4d6e21bef214092d045

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
