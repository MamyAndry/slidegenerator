@echo off
echo Packaging Slidegenerator JAR...
echo.

REM Change to project root directory
cd /d "%~dp0.."

REM Clean and package the application
mvn clean install -DskipTests

if %errorlevel% neq 0 (
    echo ERROR: Failed to package application
    pause
    exit /b 1
) else (
    echo.
    echo ✅ SUCCESS: JAR file created at target\slidegenerator-0.0.1-SNAPSHOT.jar
    echo.
    echo You can now:
    echo 1. Run the JAR directly: java -jar target\slidegenerator-0.0.1-SNAPSHOT.jar
    echo 2. Create deployment package: scripts\create-deployment.bat
    echo 3. Build EXE file: scripts\build-exe.bat
    echo.
)

pause