FROM eclipse-temurin:21.0.4_7-jdk-alpine@sha256:41336eaafc9c5fe5dce03c24473bd480be425b4d3aa402528595d2e7f46d6d99 AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY script script
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.4_7-jre-alpine@sha256:2d07bba7442286e91cb8b0583c364b645ecbf2ab4b0c8e0eabeab7832bade793

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
