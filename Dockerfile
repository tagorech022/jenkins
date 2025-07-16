# Base image with Maven and Java 17
FROM maven:3.9.6-eclipse-temurin-17

# Set working directory
WORKDIR /plugin

# Copy your plugin code into container
COPY . .

# Run tests using jenkins-test-harness
CMD ["mvn", "test"]
