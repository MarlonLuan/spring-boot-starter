FROM eclipse-temurin:21.0.4_7-jdk-alpine@sha256:5b836a84d8287dcba9c89beb5a449871430206b8ff758a7732f2e43313c0fbd4 AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY script script
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.4_7-jre-alpine@sha256:b16f1192681ea43bd6f5c435a1bf30e59fcbee560ee2c497f42118003f42d804

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
