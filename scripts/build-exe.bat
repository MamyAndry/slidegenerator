@echo off
echo Building Slidegenerator EXE...
echo.

REM Change to project root directory
cd /d "%~dp0.."

echo Step 1: Cleaning and building JAR...
call mvn clean package -DskipTests
if %errorlevel% neq 0 (
    echo ERROR: Failed to build JAR
    pause
    exit /b 1
)

echo.
echo Step 2: Creating EXE with Launch4j...
if exist "target\slidegenerator.exe" (
    echo SUCCESS: EXE file created at target\slidegenerator.exe
    echo.
    echo You can now run: target\slidegenerator.exe
    echo The application will:
    echo - Start without showing a console window
    echo - Automatically open your browser to http://localhost:8080
    echo - Run the Slidegenerator application
) else (
    echo ERROR: EXE file was not created. Please check Launch4j configuration.
)

echo.
pause