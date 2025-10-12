# Converting JAR to EXE with Auto Browser Launch

## Method 1: Using Launch4j (Recommended)

### Step 1: Download Launch4j
1. Download Launch4j from: https://launch4j.sourceforge.net/
2. Install it on your Windows machine

### Step 2: Create Launch4j Configuration
1. Open Launch4j
2. Configure the following settings:

**Basic Tab:**
- Output file: `slidegenerator.exe`
- Jar: `target\slidegenerator-0.0.1-SNAPSHOT.jar`
- Don't wrap jar: unchecked
- Icon: (optional - you can add an icon file)

**Classpath Tab:**
- Main class: `fjkm.agf.slidegenerator.SlidegeneratorApplication`

**JRE Tab:**
- Min JRE version: `17.0.0`
- Max JRE version: (leave empty)
- JRE path: (leave empty to use system JRE)

**Splash Tab:**
- (optional - you can add a splash screen)

**Version Info Tab:**
- (optional - add version information)

**Environment Tab:**
- Variables: (leave empty)

### Step 3: Generate EXE
- Click the "Build wrapper" button
- Your EXE file will be created

## Method 2: Using Maven Plugin (Automated)

Add the following plugin to your pom.xml to automate the process:

```xml
<plugin>
    <groupId>com.akathist.maven.plugins.launch4j</groupId>
    <artifactId>launch4j-maven-plugin</artifactId>
    <version>2.1.3</version>
    <executions>
        <execution>
            <id>l4j-clui</id>
            <phase>package</phase>
            <goals>
                <goal>launch4j</goal>
            </goals>
            <configuration>
                <headerType>gui</headerType>
                <jar>${project.build.directory}/${project.artifactId}-${project.version}.jar</jar>
                <outfile>${project.build.directory}/slidegenerator.exe</outfile>
                <downloadUrl>https://adoptopenjdk.net</downloadUrl>
                <classPath>
                    <mainClass>fjkm.agf.slidegenerator.SlidegeneratorApplication</mainClass>
                </classPath>
                <jre>
                    <bundledJre64Bit>false</bundledJre64Bit>
                    <bundledJreAsFallback>false</bundledJreAsFallback>
                    <minVersion>17.0.0</minVersion>
                    <jdkPreference>preferJre</jdkPreference>
                    <runtimeBits>64/32</runtimeBits>
                </jre>
                <versionInfo>
                    <fileVersion>1.0.0.0</fileVersion>
                    <txtFileVersion>${project.version}</txtFileVersion>
                    <fileDescription>${project.description}</fileDescription>
                    <copyright>2025</copyright>
                    <productVersion>1.0.0.0</productVersion>
                    <txtProductVersion>${project.version}</txtProductVersion>
                    <productName>${project.name}</productName>
                    <companyName>FJKM AGF</companyName>
                    <internalName>slidegenerator</internalName>
                    <originalFilename>slidegenerator.exe</originalFilename>
                </versionInfo>
            </configuration>
        </execution>
    </executions>
</plugin>
```

## Method 3: Using jpackage (Java 17+)

Since you're using Java 17, you can use the built-in jpackage tool:

```bash
jpackage --input target --name SlidegeneratorApp --main-jar slidegenerator-0.0.1-SNAPSHOT.jar --main-class fjkm.agf.slidegenerator.SlidegeneratorApplication --type exe --win-console
```

## Auto-Opening Browser

To automatically open the browser when the application starts, you need to modify your Spring Boot application.

### Features to Add:
1. **Hide Console Window** (Launch4j handles this)
2. **Auto-open Browser** 
3. **System Tray Integration** (optional)
4. **Graceful Shutdown** (optional)

Would you like me to:
1. Add the Launch4j plugin to your pom.xml?
2. Modify your Spring Boot application to auto-open the browser?
3. Add system tray integration so the app runs in the background?

Choose which approach you'd prefer and I'll implement it for you!