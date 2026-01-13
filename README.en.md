# Resume System

An online resume management system based on Spring Boot and MyBatis.

## Project Overview

This project is a fully-featured resume management system that provides functionalities for creating, editing, and viewing user resumes. It supports avatar uploads, project experience management, and skill display. Built with modern web technologies, it features a clean, attractive interface and intuitive user experience.

## Technology Stack

- **Backend Framework**: Spring Boot 2.x
- **ORM Framework**: MyBatis / JPA
- **Database**: MySQL (via JPA)
- **Template Engine**: FreeMarker (FTL)
- **Frontend Technologies**: HTML5, CSS3, JavaScript
- **Build Tool**: Maven
- **File Storage**: Local file system
- **Development Tools**: Spring Tool Suite (STS) or IntelliJ IDEA

## Main Features

### User Management
- Create and edit personal resumes
- Upload personal avatars
- Manage basic information (name, school, major, contact details, etc.)
- Personal introduction and job position information

### Project Experience
- Add multiple project experiences
- Each project includes: project name, description, technology stack, role, GitHub link, etc.
- Supports association between projects and users

### Skill Management
- Add personal skills
- Set skill proficiency levels
- Supports association between skills and users

### Resume Display
- Online resume viewing
- Resume editing functionality
- Attractive resume templates

## Project Structure

```
resume-system/
├── src/main/
│   ├── java/com/boot/mybatis/resumesystem/
│   │   ├── ResumeSystemApplication.java        # Spring Boot main class
│   │   ├── config/
│   │   │   └── WebConfig.java                  # Web configuration class (resource configuration)
│   │   ├── controller/
│   │   │   ├── FileController.java             # File upload controller
│   │   │   └── UserController.java             # User resume controller
│   │   ├── entity/
│   │   │   ├── User.java                       # User entity
│   │   │   ├── Project.java                    # Project entity
│   │   │   └── Skill.java                      # Skill entity
│   │   ├── repository/
│   │   │   ├── UserRepository.java             # User data access layer
│   │   │   ├── ProjectRepository.java          # Project data access layer
│   │   │   └── SkillRepository.java            # Skill data access layer
│   │   ├── service/
│   │   │   ├── UserService.java                # User business logic layer
│   │   │   ├── ProjectService.java             # Project business logic layer
│   │   │   └── SkillService.java               # Skill business logic layer
│   │   └── util/
│   │       └── FileUploadUtil.java             # File upload utility class
│   └── resources/
│       ├── application.properties              # Application configuration file
│       ├── static/css/styles.css               # Stylesheet file
│       └── templates/                          # FreeMarker templates
│           ├── resume.ftl                      # Resume display page
│           ├── resume-edit.ftl                 # Resume editing page
│           └── error.ftl                       # Error page
├── uploads/avatars/                            # Avatar upload directory
├── mvnw                                        # Maven wrapper script (Linux/Mac)
├── mvnw.cmd                                    # Maven wrapper script (Windows)
└── pom.xml                                     # Maven project configuration
```

## Environment Requirements

- JDK 1.8 or higher
- Maven 3.6 or higher
- MySQL 5.7 or higher
- Tomcat 9.x (optional; Spring Boot embeds Tomcat)

## Quick Start

### 1. Clone the Project

```bash
git clone https://gitee.com/yanqinglanyanmo/resume-system.git
cd resume-system
```

### 2. Database Configuration

Create a database in MySQL:

```sql
CREATE DATABASE resume_system DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Then configure the database connection in `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/resume_system?useSSL=false&serverTimezone=UTC
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# JPA Configuration
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
```

### 3. Configure Avatar Upload Path

Set the avatar upload path in `application.properties`:

```properties
avatar.upload.path=/path/to/your/project/uploads/avatars/
avatar.access.path=/avatars/
```

### 4. Build and Run

Build the project using Maven:

```bash
./mvnw clean package
```

Run the project:

```bash
java -jar target/resume-system-0.0.1-SNAPSHOT.jar
```

Or run via Maven:

```bash
./mvnw spring-boot:run
```

### 5. Access the Application

Open your browser and visit: http://localhost:8080

## API Endpoints

### File Upload Endpoint

**POST** `/file/upload-avatar`

Upload user avatar.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| file      | File | Yes      | Avatar file |
| userId    | Long | Yes      | User ID |

### Resume View Endpoint

**GET** `/resume/{id}`

View user resume.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id        | Long | Yes      | User ID |

### Resume Edit Page

**GET** `/resume/edit/{id}`

Display the resume editing page.

### Resume Update Endpoint

**POST** `/resume/update/{id}`

Update user resume.

| Parameter    | Type   | Required | Description |
|--------------|--------|----------|-------------|
| id           | Long   | Yes      | User ID |
| name         | String | Yes      | Name |
| school       | String | Yes      | School |
| major        | String | Yes      | Major |
| phone        | String | Yes      | Phone |
| email        | String | Yes      | Email |
| introduction | String | Yes      | Personal introduction |
| avatar       | String | No       | Avatar filename |
| avatarFile   | File   | No       | Avatar file |
| position     | String | No       | Job position |

## Project Screenshots

### Resume Display Page
- Displays user basic information
- Shows project experiences and skills
- Clean and attractive layout design

### Resume Edit Page
- Supports online resume editing
- Avatar upload preview functionality
- Form validation and error messages

## Directory Overview

### Upload Directory
- `uploads/avatars/` - Stores uploaded avatar files
- Filename format: `UUID.jpg` (to avoid filename conflicts)

### Static Resources
- `src/main/resources/static/` - Contains static resource files
- `css/styles.css` - Project stylesheet

### Template Files
- `src/main/resources/templates/` - FreeMarker template files
- `resume.ftl` - Resume display template
- `resume-edit.ftl` - Resume editing template
- `error.ftl` - Error page template

## License

This project is open-sourced under the MIT License.

## Contributors

Thank you to everyone who has contributed to this project!

## Contact

- Project URL: https://gitee.com/yanqinglanyanmo/resume-system
- Author: yanqinglanyanmo

For any questions or suggestions, feel free to submit an Issue or Pull Request.