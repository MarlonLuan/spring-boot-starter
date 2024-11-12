FROM eclipse-temurin:21.0.5_11-jdk-alpine@sha256:cff79e6191064b91dc3514def63c81be36e57341ab45306f3930a02e22dc215a AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.5_11-jre-alpine@sha256:2a0bbb1db6d8db42c66ed00c43d954cf458066cc37be12b55144781da7864fdf

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
