FROM eclipse-temurin:21.0.2_13-jdk-alpine@sha256:b5d37df8ee5bb964bb340acca83957f9a09291d07768fba1881f6bfc8048e4f5 AS builder

# Improved organization: copy application code first
WORKDIR /opt/demo
COPY ./.mvn ./.mvn
COPY ./docker ./docker
COPY ./script ./script
COPY ./src ./src
COPY mvnw .
COPY pom.xml .

# Build the application in a single stage
RUN ./mvnw clean install -DskipTests

# Final image with JRE
FROM eclipse-temurin:21.0.2_13-jre-alpine@sha256:6f78a61a2aa1e6907dda2da3eb791d44ef3d18e36aee1d1bdaa3543bd44cff4b

WORKDIR /opt/demo

# Copy JAR from builder stage
COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

# Define the entrypoint
ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
