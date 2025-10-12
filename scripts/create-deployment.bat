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

REM No EXE file needed - using JAR with launcher scripts

REM Create launcher scripts if they don't exist
if not exist "target\slidegenerator.vbs" (
    echo Creating VBS launcher...
    echo Set objShell = CreateObject("WScript.Shell"^) > "target\slidegenerator.vbs"
    echo objShell.Run "java -jar slidegenerator-0.0.1-SNAPSHOT.jar", 0, False >> "target\slidegenerator.vbs"
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
    echo Double-click slidegenerator.vbs or run-slidegenerator.bat to start. >> "target\LAUNCH_GUIDE.md"
    echo. >> "target\LAUNCH_GUIDE.md"
    echo The application will start in the background and open your browser. >> "target\LAUNCH_GUIDE.md"
    echo Visit http://localhost:8080 if the browser doesn't open automatically. >> "target\LAUNCH_GUIDE.md"
)

REM Copy launchers
echo Copying launcher scripts...
copy "target\slidegenerator.vbs" "slidegenerator-deployment\"
copy "target\run-slidegenerator.bat" "slidegenerator-deployment\"
copy "target\LAUNCH_GUIDE.md" "slidegenerator-deployment\"

REM Create a simple README
echo Creating README...
echo # Slidegenerator Application > "slidegenerator-deployment\README.txt"
echo. >> "slidegenerator-deployment\README.txt"
echo ## Windows Users >> "slidegenerator-deployment\README.txt"
echo Double-click "slidegenerator.vbs" to start the application silently. >> "slidegenerator-deployment\README.txt"
echo Alternative: Double-click "run-slidegenerator.bat" to see startup messages. >> "slidegenerator-deployment\README.txt"
echo. >> "slidegenerator-deployment\README.txt"
echo The browser will open automatically at http://localhost:8080 >> "slidegenerator-deployment\README.txt"
echo. >> "slidegenerator-deployment\README.txt"
echo Requirements: Java 17 or higher must be installed. >> "slidegenerator-deployment\README.txt"
echo. >> "slidegenerator-deployment\README.txt"
echo See LAUNCH_GUIDE.md for more options. >> "slidegenerator-deployment\README.txt"

echo.
echo ✅ Deployment package created in 'slidegenerator-deployment' folder
echo.
echo Contents:
dir /b "slidegenerator-deployment"
echo.
echo To distribute: Copy the entire 'slidegenerator-deployment' folder
echo Windows users: Double-click 'slidegenerator.vbs' for silent startup
echo              or 'run-slidegenerator.bat' to see startup messages
echo.
pause