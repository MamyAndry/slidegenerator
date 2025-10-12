@echo off
REM Change to project root directory
cd /d "%~dp0.."

REM Start the Spring Boot application
mvnw spring-boot:run