FROM eclipse-temurin:21.0.5_11-jdk-alpine@sha256:c63d8669d87e16bcee66c0379d1deedf844152da449ad48f2c8bd73a3705d36b AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.5_11-jre-alpine@sha256:03c1fb6fff9b28aa3be69f59df0a274c2c3984189726645cb383217229b25082

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
