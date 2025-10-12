@echo off
echo Creating Slidegenerator Deployment Package...
echo.

REM Change to project root directory
cd /d "%~dp0.."

REM Create deployment directory
if not exist "slidegenerator-deployment" mkdir "slidegenerator-deployment"

REM Copy JAR file
echo Copying JAR file...
if exist "target\slidegenerator-0.0.1-SNAPSHOT.jar" (
    copy "target\slidegenerator-0.0.1-SNAPSHOT.jar" "slidegenerator-deployment\"
) else (
    echo ERROR: JAR file not found. Please run 'mvn clean package' first.
    pause
    exit /b 1
)

REM Copy EXE file if it exists
if exist "target\slidegenerator.exe" (
    echo Copying EXE file...
    copy "target\slidegenerator.exe" "slidegenerator-deployment\"
    set HAS_EXE=1
) else (
    echo Note: EXE file not found. Run 'scripts\build-exe.bat' to create it.
    set HAS_EXE=0
)

REM Create launcher scripts if they don't exist
if not exist "target\slidegenerator.vbs" (
    echo Creating VBS launcher...
    echo Set objShell = CreateObject("WScript.Shell"^) > "target\slidegenerator.vbs"
    echo objShell.Run "java -jar slidegenerator-0.0.1-SNAPSHOT.jar", 0, False >> "target\slidegenerator.vbs"
)

if not exist "target\slidegenerator.ps1" (
    echo Creating PowerShell launcher...
    echo # PowerShell launcher for Slidegenerator > "target\slidegenerator.ps1"
    echo Write-Host "Starting Slidegenerator..." -ForegroundColor Green >> "target\slidegenerator.ps1"
    echo Write-Host "Browser will open automatically at http://localhost:8080" -ForegroundColor Yellow >> "target\slidegenerator.ps1"
    echo Start-Process -FilePath "java" -ArgumentList "-jar", "slidegenerator-0.0.1-SNAPSHOT.jar" -WindowStyle Hidden >> "target\slidegenerator.ps1"
)

if not exist "target\run-slidegenerator.bat" (
    echo Creating batch launcher...
    echo @echo off > "target\run-slidegenerator.bat"
    echo echo Starting Slidegenerator... >> "target\run-slidegenerator.bat"
    echo start /min java -jar slidegenerator-0.0.1-SNAPSHOT.jar >> "target\run-slidegenerator.bat"
)

if not exist "target\LAUNCH_GUIDE.md" (
    echo Creating launch guide...
    echo # Slidegenerator Launch Guide > "target\LAUNCH_GUIDE.md"
    echo. >> "target\LAUNCH_GUIDE.md"
    echo ## Windows >> "target\LAUNCH_GUIDE.md"
    echo Double-click slidegenerator.exe or slidegenerator.vbs to start. >> "target\LAUNCH_GUIDE.md"
)

REM Copy launchers
echo Copying launcher scripts...
copy "target\slidegenerator.vbs" "slidegenerator-deployment\"
copy "target\slidegenerator.ps1" "slidegenerator-deployment\"
copy "target\run-slidegenerator.bat" "slidegenerator-deployment\"
copy "target\LAUNCH_GUIDE.md" "slidegenerator-deployment\"

REM Create a simple README
echo Creating README...
if %HAS_EXE%==1 (
    echo # Slidegenerator Application > "slidegenerator-deployment\README.txt"
    echo. >> "slidegenerator-deployment\README.txt"
    echo ## Windows Users >> "slidegenerator-deployment\README.txt"
    echo RECOMMENDED: Double-click "slidegenerator.exe" to start the application. >> "slidegenerator-deployment\README.txt"
    echo Alternative: Double-click "slidegenerator.vbs" for JAR version. >> "slidegenerator-deployment\README.txt"
    echo. >> "slidegenerator-deployment\README.txt"
    echo The browser will open automatically at http://localhost:8080 >> "slidegenerator-deployment\README.txt"
    echo. >> "slidegenerator-deployment\README.txt"
    echo Requirements: Java 17 or higher must be installed. >> "slidegenerator-deployment\README.txt"
    echo. >> "slidegenerator-deployment\README.txt"
    echo See LAUNCH_GUIDE.md for more options. >> "slidegenerator-deployment\README.txt"
) else (
    echo # Slidegenerator Application > "slidegenerator-deployment\README.txt"
    echo. >> "slidegenerator-deployment\README.txt"
    echo ## Windows Users >> "slidegenerator-deployment\README.txt"
    echo Double-click "slidegenerator.vbs" to start the application. >> "slidegenerator-deployment\README.txt"
    echo. >> "slidegenerator-deployment\README.txt"
    echo The browser will open automatically at http://localhost:8080 >> "slidegenerator-deployment\README.txt"
    echo. >> "slidegenerator-deployment\README.txt"
    echo Requirements: Java 17 or higher must be installed. >> "slidegenerator-deployment\README.txt"
    echo. >> "slidegenerator-deployment\README.txt"
    echo See LAUNCH_GUIDE.md for more options. >> "slidegenerator-deployment\README.txt"
)

echo.
echo ✅ Deployment package created in 'slidegenerator-deployment' folder
echo.
echo Contents:
dir /b "slidegenerator-deployment"
echo.
echo To distribute: Copy the entire 'slidegenerator-deployment' folder
if %HAS_EXE%==1 (
    echo Windows users: Double-click 'slidegenerator.exe' ^(RECOMMENDED^)
) else (
    echo Windows users: Double-click 'slidegenerator.vbs'
)
echo.
pause