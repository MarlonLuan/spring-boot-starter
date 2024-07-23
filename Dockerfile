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

FROM eclipse-temurin:21.0.3_9-jre-alpine@sha256:f28691b4af71a91e60320257eae571c636151b89a85f222c9ba6a9685fea587f

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
