FROM eclipse-temurin:25-jdk-alpine-3.21@sha256:84f9c5aa488ef6346c1fbb29fab15e64a71494b89d3e4f9884642d464802c7c0 AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:25-jre-alpine-3.21@sha256:2f828da17384e966a425a21698cdb42da357f1a81d97f82b997533723eddf598

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
