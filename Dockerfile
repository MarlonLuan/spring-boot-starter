FROM eclipse-temurin:21.0.4_7-jdk-alpine@sha256:511d5a9217ed753d9c099d3d753111d7f9e0e40550b860bceac042f4e55f715c AS builder

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
