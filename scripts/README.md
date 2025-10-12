# Scripts Directory

This folder contains all build and deployment scripts for the Slidegenerator application.

## Available Scripts

### Development Scripts
- **`start.bat`** / **`start.ps1`** / **`start.sh`** - Start the application in development mode
  - Runs `mvn spring-boot:run`
  - No building required, hot reload enabled
  - Cross-platform support

### Build Scripts
- **`package.bat`** / **`package.ps1`** - Build the JAR file
  - Runs `mvn clean install -DskipTests`
  - Creates `target/slidegenerator-0.0.1-SNAPSHOT.jar`

- **`build-exe.bat`** - Build EXE file (Windows only, requires Launch4j)
  - First builds the JAR
  - Then creates EXE using Launch4j Maven plugin
  - Creates `target/slidegenerator.exe`

### Deployment Scripts
- **`create-deployment.bat`** - Create distribution package (Windows)
- **`create-deployment.ps1`** - Create distribution package (PowerShell)
- **`create-deployment.sh`** - Create distribution package (Linux/Mac)
  - Automatically creates missing launcher files
  - Better error handling and user feedback
  - Cross-platform support
  - Includes launchers for all operating systems
  - Cross-platform PowerShell support

## Usage Instructions

### For Development
```bash
# Windows
scripts\start.bat

# Linux/Mac
scripts/start.sh

# PowerShell (any platform)
scripts/start.ps1
```

### For Building
```bash
# Build JAR only (Windows)
scripts\package.bat

# Build JAR only (PowerShell)
scripts\package.ps1

# Build EXE (Windows only)
scripts\build-exe.bat

# Create deployment package (Windows batch)
scripts\create-deployment.bat

# Create deployment package (PowerShell)
scripts\create-deployment.ps1

# Create deployment package (Linux/Mac)
scripts/create-deployment.sh
```

## Script Locations
All scripts automatically navigate to the project root directory, so they can be run from anywhere.

## Requirements
- Java 17 or higher
- Maven 3.6 or higher
- Launch4j (for EXE creation only)

## Output Locations
- JAR files: `target/`
- EXE files: `target/`
- Deployment package: `slidegenerator-deployment/`