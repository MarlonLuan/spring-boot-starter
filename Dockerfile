FROM eclipse-temurin:21.0.2_13-jdk-alpine AS builder

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
FROM eclipse-temurin:21.0.2_13-jre-alpine

WORKDIR /opt/demo

# Copy JAR from builder stage
COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

# Define the entrypoint
ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
