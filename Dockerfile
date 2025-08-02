FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar telemedicine_consultation_app.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "telemedicine_consultation_app.jar"]
