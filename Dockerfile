FROM eclipse-temurin:21.0.8_9-jdk-alpine-3.21@sha256:02530d421294840308bd3dd026ec204e0ba62fc6f644e2694b77924bfa29c083 AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.8_9-jre-alpine-3.21@sha256:0e0546003ca7a6c9374c556a620bd7d473491f68e583f5a805eda70153160049

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
