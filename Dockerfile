FROM eclipse-temurin:21.0.3_9-jdk-alpine@sha256:68a8a4ad547e750f497824540d90ff29d4b819a6a6287a5eb1b03a71e4c2167b AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY script script
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.3_9-jre-alpine@sha256:f05c742dd20051b104b939370f7db4d6eb420cc7fd842aeb4e2446837da3bd03

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
