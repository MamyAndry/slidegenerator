# Slidegenerator

[![Java](https://img.shields.io/badge/Java-17+-blue.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.5-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Thymeleaf](https://img.shields.io/badge/Thymeleaf-3.1-green.svg)](https://www.thymeleaf.org/)
[![Apache POI](https://img.shields.io/badge/Apache%20POI-5.2.4-orange.svg)](https://poi.apache.org/)
[![License](https://img.shields.io/badge/License-Custom-red.svg)](#license)

A powerful **PowerPoint slide generator** designed specifically for **FJKM AGF** (Fiangonana Jesosy Kristy eto Madagasikara - Andry sy Getorolahy sy Firenena) church services. This application automates the creation of liturgical presentations including hymns, programs, and baptism ceremonies.

## 🌟 Features

### 📊 **Slide Generation Capabilities**

- **🎵 Individual Hymn Slides**: Generate slides for single hymns with customizable fonts and formatting
- **📚 Multiple Hymn Slides**: Create presentations with multiple hymns in batch
- **📋 Complete Programs**: Generate full liturgical service presentations
- **⛪ Baptism Ceremonies**: Specialized slides for "Fandraisana Fanasan'ny Tompo" (Holy Baptism)
- **📖 All Hymns**: Bulk generation of all available hymns

### 🎨 **Customization Options**

- **Font Family & Size**: Customizable typography for both content and hymns
- **Image Opacity**: Adjustable background image transparency
- **Multiple Liturgy Types**: Support for various service formats (Voalohany, Faharoa, Fahatelo, Fahaefatra, Fanambadiana, Fahafatesana)
- **Flexible Content**: Support for Scripture readings, testimonies, and God's work sections

### 🖥️ **Modern Web Interface**

- **Single Page Application (SPA)**: Fast, responsive user experience
- **Bootstrap UI**: Clean, professional interface with AdminLTE theme
- **Real-time Validation**: Form validation with immediate feedback
- **Conditional Fields**: Dynamic form sections based on user selections
- **Multi-language Support**: Malagasy language interface

### 📦 **Deployment & Distribution**

- **Multiple Launch Options**: VBS, PowerShell, Batch, and EXE launchers
- **Windows-Optimized**: Streamlined deployment for Windows environments
- **Portable Application**: No installation required - just extract and run
- **Auto Browser Launch**: Automatically opens web interface on startup

## 🚀 Quick Start

### Prerequisites

- **Java 17 or higher** (Required)
- **Windows Operating System** (Recommended)
- **Microsoft PowerPoint** (For viewing generated slides)

### Option 1: Using Pre-built Release (Recommended)

1. **Download** the latest release from the releases section
2. **Extract** the `slidegenerator-deployment` folder
3. **Double-click** `slidegenerator.exe` (if available) or `slidegenerator.vbs`
4. **Access** the application at `http://localhost:8080`

### Option 2: Building from Source

```bash
# Clone the repository
git clone https://github.com/MamyAndry/slidegenerator.git
cd slidegenerator

# Build the application
mvnw clean package

# Create deployment package
scripts\create-deployment.bat

# Run the application
cd slidegenerator-deployment
slidegenerator.exe
```

## 📋 Usage Guide

### 🏠 **Home Dashboard**

Navigate through four main options:
- **Hira Iray**: Generate single hymn slides
- **Hira Maro**: Create multiple hymn presentations  
- **Programa**: Build complete service programs
- **Hira Rehetra**: Generate all hymns in bulk

### 🎵 **Creating Hymn Slides**

1. **Select Hymn Type** from the home dashboard
2. **Choose Your Hymn(s)** from the dropdown
3. **Configure Formatting**:
   - Font family and size
   - Output directory path
4. **Generate Slides** - PowerPoint files are created automatically

### 📋 **Building Service Programs**

1. **Access Program Builder** from the home page
2. **Configure General Settings**:
   - Slide name and output path
   - Liturgy type selection
   - Scripture readings (Fiderana, Sekoly Alahady)
   - Confession of faith
3. **Select Hymns**:
   - Entry hymn (Hira Fidirana)
   - Service content (Perikopa, testimonies, God's work)
4. **Optional Baptism Section**:
   - Toggle "Fandraisana" option
   - Select presentation and closing hymns
5. **Customize Appearance**:
   - Font families and sizes for content and hymns
   - Background image opacity
6. **Generate Complete Presentation**

### ⛪ **Baptism Ceremonies**

When creating programs with baptism:
- Enable the "Fandraisana" option
- Additional fields appear for baptism-specific hymns
- Specialized liturgical elements are included
- Complete baptism service flow is generated

## 🛠️ Technical Architecture

### **Backend Technologies**

- **Spring Boot 3.2.5**: Modern Java web framework
- **Apache POI 5.2.4**: PowerPoint file generation
- **Thymeleaf**: Server-side template engine
- **Maven**: Dependency management and build tool

### **Frontend Technologies**

- **Bootstrap 5**: Responsive CSS framework
- **AdminLTE 3**: Professional admin template
- **jQuery**: JavaScript library for DOM manipulation
- **Font Awesome**: Icon library

### **Data Sources**

- **JSON Configuration**: Hymn data and liturgical structures
- **Resource Files**: Background images and templates
- **Dynamic Content**: User-generated form data

## 📁 Project Structure

```
slidegenerator/
├── src/main/
│   ├── java/fjkm/agf/slidegenerator/
│   │   ├── configuration/          # Liturgy configurations
│   │   ├── controller/             # Spring MVC controllers
│   │   ├── hiracomponents/         # Hymn processing
│   │   ├── litorjiacomponents/     # Liturgy components
│   │   ├── mapping/                # Data mapping classes
│   │   ├── powerpoint/             # PPT generation
│   │   └── utils/                  # Utility classes
│   └── resources/
│       ├── templates/              # Thymeleaf templates
│       │   ├── components/         # SPA components
│       │   └── fragments/          # Reusable fragments
│       ├── static/                 # CSS, JS, images
│       ├── hira/                   # Hymn JSON data
│       └── litorjia/               # Liturgy configurations
├── scripts/                        # Build and deployment scripts
├── documentation/                  # Technical documentation
└── target/                         # Build outputs
```

## 🔧 Configuration

### **Application Properties**

Located in `src/main/resources/application.properties`:

```properties
server.port=8080
spring.thymeleaf.cache=false
logging.level.fjkm.agf.slidegenerator=DEBUG
```

### **Hymn Data**

Hymn information is stored in JSON files in `src/main/resources/hira/`:
- `01_fihirana_ffpm.json`: FFPM hymnal
- `02_fihirana_fanampiny.json`: Additional hymns
- `03_antema.json`: Anthems
- `04_hira_salamo.json`: Psalm hymns
- `05_fihirana_fifohazana.json`: Revival hymns

### **Liturgy Configuration**

Liturgical structures are defined in `src/main/resources/litorjia/litorjia.json`

## 🚀 Deployment Options

### **Development Mode**

```bash
mvnw spring-boot:run
```
Access at `http://localhost:8080`

### **Production Deployment**

1. **Build**: `mvnw clean package`
2. **Deploy**: Use `scripts\create-deployment.bat`
3. **Distribute**: Copy the `slidegenerator-deployment` folder

### **Launcher Options**

- **slidegenerator.exe**: Windows executable (recommended)
- **slidegenerator.vbs**: Silent VBScript launcher
- **run-slidegenerator.bat**: Traditional batch file
- **slidegenerator.ps1**: PowerShell launcher (removed in latest version)

## 🧪 Testing

Run tests with:

```bash
mvnw test
```

## 📖 API Documentation

### **Main Endpoints**

- `GET /` - Main application interface
- `GET /component/{componentName}` - SPA component loading
- `POST /treatment-programa` - Program generation
- `POST /treatment-hira-maro` - Multiple hymn generation
- `GET /treatment-hira-rehetra` - All hymns generation

### **Form Data Processing**

The application processes complex form data including:
- Multi-line text areas for testimonies and God's work
- Dynamic hymn selections
- Conditional baptism fields
- Font and styling configurations

## 🐛 Troubleshooting

### **Common Issues**

1. **Port 8080 in use**: Change port in `application.properties` or stop conflicting services
2. **Java not found**: Ensure Java 17+ is installed and in PATH
3. **PowerPoint files not opening**: Verify Microsoft Office installation
4. **Hymn data missing**: Check JSON files in `resources/hira/`

### **Logs and Debugging**

- Application logs appear in console during development
- Enable debug logging by setting `logging.level.fjkm.agf.slidegenerator=DEBUG`
- Check browser console for JavaScript errors

## 🤝 Contributing

### **Development Setup**

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

### **Code Standards**

- Follow Java naming conventions
- Use meaningful variable and method names
- Add comments for complex liturgical logic
- Maintain consistent indentation

## 📄 License

This project is proprietary software developed for FJKM. 
All rights reserved.

## 👥 Authors

- **Primary Developer**: MamyAndry

## 🙏 Acknowledgments

- Spring Boot community for excellent documentation
- Apache POI team for PowerPoint generation capabilities
- Thymeleaf team for the flexible template engine

## 📞 Support

For technical support or feature requests:
- Create an issue in this repository
- Contact the development team through email to aosimamamisoa@gmail.com 


## 🔄 Version History

- **v1**: Initial release with the front powered by JSP 
- **v2**: Changet the front to Thymeleaf and turned the whole application to SPA (Single Page Application)

---

**Built with ❤️ for FJKM church services**

*This application helps streamline the creation of professional liturgical presentations, enabling church leaders to focus on spiritual matters while maintaining high-quality visual worship aids.*