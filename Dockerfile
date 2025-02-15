FROM eclipse-temurin:21.0.6_7-jdk-alpine@sha256:08eff1ab52c5f50b6ebe554cdcd4045cd2216226c6b83087fbb101b57b459711 AS builder

WORKDIR /opt/demo

COPY .mvn .mvn
COPY docker docker
COPY scripts scripts
COPY src src
COPY mvnw .
COPY pom.xml .

# RUN ./mvnw clean install
RUN ./mvnw clean install -DskipTests

FROM eclipse-temurin:21.0.6_7-jre-alpine@sha256:7fee222ab26fb3634ee95d722ee9e2e2e6b6447a2c68debeac9cc9039954d4af

WORKDIR /opt/demo

COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
