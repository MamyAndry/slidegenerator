#!/bin/bash
# Cross-platform deployment script for Slidegenerator

echo "Creating Slidegenerator Deployment Package..."
echo ""

# Change to project root directory
cd "$(dirname "$0")/.."

# Create deployment directory
if [ ! -d "slidegenerator-deployment" ]; then
    mkdir "slidegenerator-deployment"
fi

# Copy JAR file
echo "Copying JAR file..."
if [ -f "target/slidegenerator-0.0.1-SNAPSHOT.jar" ]; then
    cp "target/slidegenerator-0.0.1-SNAPSHOT.jar" "slidegenerator-deployment/"
else
    echo "ERROR: JAR file not found. Please run 'mvn clean package' first."
    exit 1
fi

# Create launcher scripts if they don't exist
echo "Ensuring launcher scripts exist..."

# Linux/Mac Shell launcher
if [ ! -f "target/slidegenerator.sh" ]; then
    echo "Creating shell launcher..."
    cat > "target/slidegenerator.sh" << 'EOF'
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
EOF
    chmod +x "target/slidegenerator.sh"
fi

# Create launch guide
if [ ! -f "target/LAUNCH_GUIDE.md" ]; then
    echo "Creating launch guide..."
    cat > "target/LAUNCH_GUIDE.md" << 'EOF'
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
- For Linux/Mac: make sure the script is executable with `chmod +x slidegenerator.sh`

## Manual Launch
You can also run directly from command line:
```bash
java -jar slidegenerator-0.0.1-SNAPSHOT.jar
```
EOF
fi

# Copy launchers
echo "Copying launcher scripts..."
cp "target/slidegenerator.sh" "slidegenerator-deployment/"
cp "target/LAUNCH_GUIDE.md" "slidegenerator-deployment/"

# Make shell script executable
chmod +x "slidegenerator-deployment/slidegenerator.sh"

# Create platform-specific README
echo "Creating README..."
if [ "$HAS_EXE" = true ]; then
    cat > "slidegenerator-deployment/README.txt" << 'EOF'
# Slidegenerator Application

## Windows Users
RECOMMENDED: Double-click "slidegenerator.exe" to start the application.
Alternative: Double-click "slidegenerator.vbs" for JAR version.

## Linux/Mac Users
Run from terminal: ./slidegenerator.sh

The browser will open automatically at http://localhost:8080

Requirements: Java 17 or higher must be installed.

See LAUNCH_GUIDE.md for more options.
EOF
else
    cat > "slidegenerator-deployment/README.txt" << 'EOF'
# Slidegenerator Application

## Windows Users
Double-click "slidegenerator.vbs" to start the application.

## Linux/Mac Users
Run from terminal: ./slidegenerator.sh

The browser will open automatically at http://localhost:8080

Requirements: Java 17 or higher must be installed.

See LAUNCH_GUIDE.md for more options.
EOF
fi

echo ""
echo "✅ Deployment package created in 'slidegenerator-deployment' folder"
echo ""
echo "Contents:"
ls -la "slidegenerator-deployment/"
echo ""
echo "To distribute: Copy the entire 'slidegenerator-deployment' folder"
if [ "$HAS_EXE" = true ]; then
    echo "Windows users: Double-click 'slidegenerator.exe' (RECOMMENDED)"
    echo "Linux/Mac users: Run './slidegenerator.sh' from terminal"
else
    echo "Windows users: Double-click 'slidegenerator.vbs'"
    echo "Linux/Mac users: Run './slidegenerator.sh' from terminal"
fi
echo ""