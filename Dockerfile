FROM eclipse-temurin:21.0.5_11-jdk-alpine@sha256:56ffb38891c7ea074c1dd42cc9a978206b7c2752589f8f613e383050a8af0e50 AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.5_11-jre-alpine@sha256:41502ff7105c996a588c68647da859759b5fc457bca6f4bf3edbc59e3b75423c

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
