FROM eclipse-temurin:21.0.7_6-jdk-alpine-3.21@sha256:334467029ba74a6c56f0620db0a63c858f244fc77ce5506fc76becfb76f2fa4b AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.7_6-jre-alpine-3.21@sha256:2ef9a11f5914256c3bf9bb8ef3279d6570fb7429cfdb8bbadffddf5dd6789837

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
