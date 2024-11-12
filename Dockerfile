FROM eclipse-temurin:21.0.5_11-jdk-alpine@sha256:4909fb9ab52e3ce1488cc6e6063da71a0f9f9833420cc254fe03bbe25daec9e0 AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.5_11-jre-alpine@sha256:8a929133a9720468599ca8f854eea6514435e050606dbbb4cd17478c22e9fe37

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
