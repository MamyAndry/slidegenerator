# PowerShell script to package Slidegenerator JAR
Write-Host "Packaging Slidegenerator JAR..." -ForegroundColor Green
Write-Host ""

# Change to project root directory
Set-Location (Join-Path $PSScriptRoot "..")

# Clean and package the application
& mvn clean install -DskipTests

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ SUCCESS: JAR file created at target\slidegenerator-0.0.1-SNAPSHOT.jar" -ForegroundColor Green
    Write-Host ""
    Write-Host "You can now:" -ForegroundColor Yellow
    Write-Host "1. Run the JAR directly: java -jar target\slidegenerator-0.0.1-SNAPSHOT.jar"
    Write-Host "2. Create deployment package: scripts\create-deployment.bat"
    Write-Host "3. Build EXE file: scripts\build-exe.bat"
    Write-Host ""
} else {
    Write-Host "ERROR: Failed to package application" -ForegroundColor Red
    exit 1
}

Read-Host "Press Enter to continue"