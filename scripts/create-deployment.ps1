# PowerShell deployment script for Slidegenerator
Write-Host "Creating Slidegenerator Deployment Package..." -ForegroundColor Green
Write-Host ""

# Change to project root directory
Set-Location (Join-Path $PSScriptRoot "..")

# Create deployment directory
if (!(Test-Path "slidegenerator-deployment")) {
    New-Item -ItemType Directory -Name "slidegenerator-deployment" | Out-Null
}

# Copy JAR file
Write-Host "Copying JAR file..." -ForegroundColor Yellow
if (Test-Path "target\slidegenerator-0.0.1-SNAPSHOT.jar") {
    Copy-Item "target\slidegenerator-0.0.1-SNAPSHOT.jar" "slidegenerator-deployment\"
} else {
    Write-Host "ERROR: JAR file not found. Please run 'mvn clean package' first." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Copy EXE file if it exists
$HasEXE = $false
if (Test-Path "target\slidegenerator.exe") {
    Write-Host "Copying EXE file..." -ForegroundColor Yellow
    Copy-Item "target\slidegenerator.exe" "slidegenerator-deployment\"
    $HasEXE = $true
} else {
    Write-Host "Note: EXE file not found. Run 'scripts\build-exe.bat' to create it." -ForegroundColor Cyan
}

# Create launcher scripts if they don't exist
Write-Host "Ensuring launcher scripts exist..." -ForegroundColor Yellow

if (!(Test-Path "target\slidegenerator.vbs")) {
    Write-Host "Creating VBS launcher..."
    @'
Set objShell = CreateObject("WScript.Shell")
objShell.Run "java -jar slidegenerator-0.0.1-SNAPSHOT.jar", 0, False
'@ | Out-File -FilePath "target\slidegenerator.vbs" -Encoding ASCII
}

if (!(Test-Path "target\slidegenerator.ps1")) {
    Write-Host "Creating PowerShell launcher..."
    @'
# PowerShell launcher for Slidegenerator
Write-Host "Starting Slidegenerator..." -ForegroundColor Green
Write-Host "Browser will open automatically at http://localhost:8080" -ForegroundColor Yellow
Write-Host ""
Start-Process -FilePath "java" -ArgumentList "-jar", "slidegenerator-0.0.1-SNAPSHOT.jar" -WindowStyle Hidden
Write-Host "Application started! Check your browser." -ForegroundColor Green
'@ | Out-File -FilePath "target\slidegenerator.ps1" -Encoding UTF8
}

if (!(Test-Path "target\run-slidegenerator.bat")) {
    Write-Host "Creating batch launcher..."
    @'
@echo off
echo Starting Slidegenerator...
echo Browser will open automatically at http://localhost:8080
echo.
start /min java -jar slidegenerator-0.0.1-SNAPSHOT.jar
'@ | Out-File -FilePath "target\run-slidegenerator.bat" -Encoding ASCII
}

if (!(Test-Path "target\LAUNCH_GUIDE.md")) {
    Write-Host "Creating launch guide..."
    @'
# Slidegenerator Launch Guide

## Quick Start

### Windows
Double-click any of these files to start the application:
- **`slidegenerator.exe`** - Native Windows executable (RECOMMENDED - if available)
- **`slidegenerator.vbs`** - Silent launch (no console window)
- **`run-slidegenerator.bat`** - Batch file launch (minimized console)
- **`slidegenerator.ps1`** - PowerShell launch (with status messages)

### Linux/Mac
Run from terminal:
- **`./slidegenerator.sh`** - Shell script launcher (RECOMMENDED)
- **`java -jar slidegenerator-0.0.1-SNAPSHOT.jar`** - Direct JAR execution

## What Happens
1. The application starts automatically
2. Your browser opens to http://localhost:8080
3. The Slidegenerator interface loads

## Requirements
- Java 17 or higher must be installed
- Port 8080 must be available

## Troubleshooting
- If browser doesn't open: manually go to http://localhost:8080
- If port 8080 is busy: the app will try port 8081, 8082, etc.
- For PowerShell script: you may need to run `Set-ExecutionPolicy RemoteSigned`
- For Linux/Mac: make sure the script is executable with `chmod +x slidegenerator.sh`

## Manual Launch
You can also run directly from command line:
```
java -jar slidegenerator-0.0.1-SNAPSHOT.jar
```
'@ | Out-File -FilePath "target\LAUNCH_GUIDE.md" -Encoding UTF8
}

if (!(Test-Path "target\slidegenerator.sh")) {
    Write-Host "Creating shell launcher for Linux/Mac..."
    @'
#!/bin/bash
# Linux/Mac launcher for Slidegenerator
echo "Starting Slidegenerator..."
echo "Browser will open automatically at http://localhost:8080"
echo ""

# Start the application in the background
nohup java -jar slidegenerator-0.0.1-SNAPSHOT.jar > /dev/null 2>&1 &

# Wait a moment for the application to start
sleep 3

# Try to open browser (works on most Linux distributions)
if command -v xdg-open > /dev/null; then
    xdg-open http://localhost:8080
elif command -v gnome-open > /dev/null; then
    gnome-open http://localhost:8080
elif command -v kde-open > /dev/null; then
    kde-open http://localhost:8080
elif command -v open > /dev/null; then
    # macOS
    open http://localhost:8080
else
    echo "Please open your browser manually and go to: http://localhost:8080"
fi

echo "Application started! Check your browser."
'@ | Out-File -FilePath "target\slidegenerator.sh" -Encoding UTF8
}

# Copy launchers
Write-Host "Copying launcher scripts..." -ForegroundColor Yellow
Copy-Item "target\slidegenerator.vbs" "slidegenerator-deployment\"
Copy-Item "target\slidegenerator.ps1" "slidegenerator-deployment\"
Copy-Item "target\run-slidegenerator.bat" "slidegenerator-deployment\"
Copy-Item "target\slidegenerator.sh" "slidegenerator-deployment\"
Copy-Item "target\LAUNCH_GUIDE.md" "slidegenerator-deployment\"

# Create a simple README
Write-Host "Creating README..." -ForegroundColor Yellow
if ($HasEXE) {
    @'
# Slidegenerator Application

## Windows Users
RECOMMENDED: Double-click "slidegenerator.exe" to start the application.
Alternative: Double-click "slidegenerator.vbs" for JAR version.

## Linux/Mac Users
Run from terminal: ./slidegenerator.sh

The browser will open automatically at http://localhost:8080

Requirements: Java 17 or higher must be installed.

See LAUNCH_GUIDE.md for more options.
'@ | Out-File -FilePath "slidegenerator-deployment\README.txt" -Encoding UTF8
} else {
    @'
# Slidegenerator Application

## Windows Users
Double-click "slidegenerator.vbs" to start the application.

## Linux/Mac Users
Run from terminal: ./slidegenerator.sh

The browser will open automatically at http://localhost:8080

Requirements: Java 17 or higher must be installed.

See LAUNCH_GUIDE.md for more options.
'@ | Out-File -FilePath "slidegenerator-deployment\README.txt" -Encoding UTF8
}

Write-Host ""
Write-Host "✅ Deployment package created in 'slidegenerator-deployment' folder" -ForegroundColor Green
Write-Host ""
Write-Host "Contents:" -ForegroundColor Yellow
Get-ChildItem "slidegenerator-deployment" | Select-Object Name | Format-Table -HideTableHeaders
Write-Host ""
Write-Host "To distribute: Copy the entire 'slidegenerator-deployment' folder" -ForegroundColor Cyan
if ($HasEXE) {
    Write-Host "Windows users: Double-click 'slidegenerator.exe' (RECOMMENDED)" -ForegroundColor Green
    Write-Host "Linux/Mac users: Run './slidegenerator.sh' from terminal" -ForegroundColor Green
} else {
    Write-Host "Windows users: Double-click 'slidegenerator.vbs'" -ForegroundColor Cyan
    Write-Host "Linux/Mac users: Run './slidegenerator.sh' from terminal" -ForegroundColor Cyan
}
Write-Host ""
Read-Host "Press Enter to continue"