# 📚 Book REST API Service (Project 1)

## 🌟 Overview
This project is a fully functional **Spring Boot 4 RESTful API**, developed as part of the [Udemy course](https://www.udemy.com/course/spring-boot-rest-apis).  
It showcases essential backend development skills, including:

- CRUD operations
- Clean architecture principles
- Professional containerization with Docker

The service manages a collection of books and provides **well-documented endpoints** for easy integration and testing.

---

## ⚙️ Technology Stack
- **Language:** Java 25 (Temurin JDK)
- **Framework:** Spring Boot 4
- **Build Tool:** Maven
- **API Documentation:** Swagger/OpenAPI (`springdoc-openapi-starter-webmvc-ui`)
- **Containerization:** Docker (Multi-Stage Build) & Docker Compose
- **Data Storage:** In-Memory Java `List` (ideal for rapid prototyping in the initial phase)

---

## 🚀 Getting Started
The recommended way to run this application is via **Docker Compose**.

### Prerequisites
- Installed **Docker** and **Docker Compose** (e.g., on Fedora/Linux).
- Project successfully packaged into a JAR file:

target/books-0.0.1-SNAPSHOT.jar


### 1. Build and Run the Container
From the project root directory, execute:

```bash
docker compose up --build -d
```
This will:

Build the Docker image using a multi-stage process

Start the containerized application

Expose the REST API endpoints locally

## 📖 API Documentation

Once the application is running, you can explore and test the endpoints via Swagger UI:

http://localhost:8080/docs

## 🛠️ Features
- **Full CRUD**: Create, Read, Update, and Delete books.
- **Architecture**: Clean separation of concerns following layered architecture.
- **Deployment**: Containerized deployment for consistent environments.
- **Testing**: Interactive API documentation for quick testing.

## 📌 Notes

- This project is part of **Books Project 1** in the course curriculum.
- Future iterations may include persistent storage (e.g., PostgreSQL) and advanced features.

