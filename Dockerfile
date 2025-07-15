# Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-17 as builder

# Set working directory inside container
WORKDIR /app

# Copy the entire project
COPY . .

# Build the application (skip tests if desired)
RUN mvn clean package -DskipTests

# Stage 2: Run the Spring Boot application
FROM eclipse-temurin:17-jdk

# Set working directory for the final image
WORKDIR /app

# Copy the executable jar from the builder stage
COPY --from=builder /app/target/demo-workshop-2.0.2.jar app.jar

# Expose application port (optional, for documentation)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
