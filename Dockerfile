FROM eclipse-temurin:25.0.1_8-jdk-alpine-3.21@sha256:3badf2f97fd8594fdf0f63a2d42432f46d8bb88ca0375995e4c5131418683cfc AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:25.0.1_8-jre-alpine-3.21@sha256:982307274064c592e3f4f8884b082e21f35f6fc283a415bfa71c5db5c5e2f4b5

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
