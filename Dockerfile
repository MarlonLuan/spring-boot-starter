FROM eclipse-temurin:21.0.3_9-jdk-alpine@sha256:cd77ea279fa771540f5ddac4fba3787cfdfd527adeb80b6b8a3aadbf78cfa4ea AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY script script
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.3_9-jre-alpine@sha256:23467b3e42617ca197f43f58bc5fb03ca4cb059d68acd49c67128bfded132d67

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
