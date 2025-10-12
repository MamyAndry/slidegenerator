# PowerShell script to start Slidegenerator in development mode
Write-Host "Starting Slidegenerator in development mode..." -ForegroundColor Green
Write-Host ""

# Change to project root directory
Set-Location (Join-Path $PSScriptRoot "..")

# Start the Spring Boot application
& mvn spring-boot:run