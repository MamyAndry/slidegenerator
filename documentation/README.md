# Slide Generator Application

A Spring Boot web application for generating PowerPoint presentation slides, specifically designed for creating hymn and program slides for religious services.

## 📋 Overview

The Slide Generator Application is a comprehensive web-based tool that enables users to create professional PowerPoint presentations for religious services. It specializes in generating slides for hymns (hira) and service programs with customizable formatting options.

## ✨ Features

- **Single Hymn Generation**: Create slides for individual hymns with custom formatting
- **Multiple Hymn Processing**: Select and generate slides for multiple hymns at once
- **Program Slide Creation**: Generate structured slides for service programs
- **Batch Processing**: Process all available hymns in one operation
- **Customizable Settings**: 
  - Font family and size configuration
  - Image opacity settings
  - Custom slide layouts
- **Interactive Web Interface**: User-friendly interface with searchable dropdowns
- **Sortable Lists**: Drag-and-drop functionality for organizing hymn order

## 🛠 Technology Stack

- **Backend**: Spring Boot 3.x
- **Frontend**: JSP, Bootstrap 4, AdminLTE 3
- **JavaScript Libraries**: jQuery, jQuery UI, jQuery Editable Select
- **Build Tool**: Maven
- **Java Version**: Java 17+ (with preview features enabled)
- **Presentation Library**: Apache POI for PowerPoint generation

## 📁 Project Structure

```
slidegenerator/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── fjkm/agf/slidegenerator/
│   │   │       ├── SlidegeneratorApplication.java
│   │   │       ├── controller/
│   │   │       ├── hiracomponents/
│   │   │       └── utils/
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   ├── hira/
│   │   │   │   ├── 01_fihirana_ffpm.json
│   │   │   │   └── 02_fihirana_fanampiny.json
│   │   │   └── static/
│   │   │       ├── css/
│   │   │       ├── js/
│   │   │       └── images/
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           └── jsp/
│   │               ├── fragments/
│   │               │   ├── nav-bar.html
│   │               │   └── side-bar.html
│   │               ├── form-hira.jsp
│   │               ├── form-hira-maro.jsp
│   │               ├── form-programme.jsp
│   │               └── form-hira-rehetra.jsp
│   └── test/
│       └── java/
│           └── fjkm/agf/slidegenerator/
└── documentation/
    └── README.md
```

## 🚀 Getting Started

### Prerequisites

- **Java 17** or higher
- **Maven 3.6+**
- **Web browser** with JavaScript enabled

### Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd slidegenerator
   ```

2. **Build the application**:
   ```bash
   mvn clean install
   ```

3. **Run the application**:
   ```bash
   mvn spring-boot:run
   ```

4. **Access the application**:
   Open your browser and navigate to `http://localhost:8080`

### Building Standalone Executable

To create a Windows executable (.exe):

```bash
jpackage ^
  --type exe ^
  --name SlideGenerator ^
  --input target ^
  --main-jar slidegenerator-0.0.1-SNAPSHOT.jar ^
  --main-class org.springframework.boot.loader.JarLauncher ^
  --java-options "--enable-preview" ^
  --win-console
```

## ⚙ Configuration

### Application Properties

```properties
spring.application.name=slidegenerator
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp
```

### Main Application Class

```java
@SpringBootApplication
public class SlidegeneratorApplication {
    public static void main(String[] args) {
        SpringApplication.run(SlidegeneratorApplication.class, args);
    }
}
```

## 📖 Usage Guide

### Navigation Menu

The application provides four main functions accessible through the sidebar:

1. **Mamokatra hira iray** (Generate Single Hymn)
   - Select a single hymn from the dropdown
   - Customize font settings
   - Generate PowerPoint presentation

2. **Mamokatra hira maro** (Generate Multiple Hymns)
   - Use searchable dropdown to select hymns
   - Add hymns to a sortable list
   - Batch generate presentations

3. **Mamokatra programa** (Generate Program)
   - Create structured program slides
   - Configure image opacity settings
   - Select opening and closing hymns

4. **Mamokatra ny hira rehetra** (Generate All Hymns)
   - Process all available hymns
   - Bulk generation functionality

### Key Features

- **Searchable Dropdowns**: Type to filter hymn options
- **Drag-and-Drop Sorting**: Reorder selected hymns
- **Real-time Validation**: Form validation before submission
- **Responsive Design**: Works on desktop and mobile devices

## 🎵 Hymn Data Format

Hymns are stored in JSON format with the following structure:

```json
{
  "fihirana": {
    "hf_26": {
      "hira": [
        {
          "andininy": 1,
          "tononkira": "Hymn verse text...",
          "fiverenany": false
        }
      ]
    }
  }
}
```

## 🧪 Testing

Run tests with:

```bash
mvn test
```

Test structure mirrors the main source structure:

```
src/test/java/fjkm/agf/slidegenerator/
├── SlidegeneratorApplicationTests.java
├── controller/
├── hiracomponents/
└── utils/
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.

## 📞 Support

For support, bug reports, or feature requests:

- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation for common solutions

*Built with ❤️ for religious communities using Spring Boot and modern web technologies.*