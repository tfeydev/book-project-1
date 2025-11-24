# Stage 1: Build the application artifact
# We use a full JDK image (temurin:25-jdk) because it contains the tools
# needed to build the project (like Maven/Gradle, which you run beforehand
# but a build stage is common for CI/CD environments).
# This stage is named 'builder'
FROM eclipse-temurin:25-jdk-alpine AS builder

# Set up the working directory inside the builder stage
WORKDIR /app

# Copy the build file (pom.xml) first to leverage Docker's layer caching.
# This ensures dependencies are only re-downloaded if pom.xml changes.
COPY pom.xml .

# This step is commented out because you typically build the JAR outside of Docker
# for simple development. However, for a robust CI/CD pipeline, you would
# copy the source code and build it here:
# COPY src ./src
# RUN ./mvnw clean package -DskipTests

# Since you already have the JAR:
# Copy the pre-built JAR from the host machine to the builder stage
COPY target/books-0.0.1-SNAPSHOT.jar app.jar


# ---

# Stage 2: Create the final, lightweight runtime image
# We switch to a JRE-only image (temurin:25-jre-alpine), which is much smaller.
FROM eclipse-temurin:25-jre-alpine

# Set metadata
LABEL maintainer="Thorsten Fey"
LABEL version="1.0"
LABEL description="Books API using Spring Boot"

# Define the working directory in the final image
WORKDIR /app

# Copy the JAR artifact from the 'builder' stage into the final image
COPY --from=builder /app/app.jar app.jar

# Spring Boot default port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]