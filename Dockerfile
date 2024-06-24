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

FROM eclipse-temurin:21.0.3_9-jre-alpine@sha256:11cb6264789abec7478d085b7bd3f7263dbea23ca261c795c03ade9d4d449ff4

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
