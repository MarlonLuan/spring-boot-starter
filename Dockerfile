FROM eclipse-temurin:21.0.3_9-jdk-alpine@sha256:ebfc28d35b192c55509e3c7cc597d91136528f1a9d3261965b44663af9eb4b4b AS builder

# Improved organization: copy application code first
WORKDIR /opt/demo
COPY .mvn .mvn
COPY docker docker
COPY script script
COPY src src
COPY mvnw .
COPY pom.xml .

# Build the application in a single stage
RUN ./mvnw clean install -DskipTests

# Final image with JRE
FROM eclipse-temurin:21.0.3_9-jre-alpine@sha256:23467b3e42617ca197f43f58bc5fb03ca4cb059d68acd49c67128bfded132d67

WORKDIR /opt/demo

# Copy JAR from builder stage
COPY --from=builder /opt/demo/target/*.jar /opt/demo/app.jar

# Define the entrypoint
ENTRYPOINT ["java", "-jar", "/opt/demo/app.jar"]
