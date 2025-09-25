# Inventify API

RESTful API for the "Inventify" inventory management system. Built with NestJS, TypeScript, and PostgreSQL, and fully dockerized for easy deployment and development.

## ✨ Features

- **Modern Framework**: Built with NestJS, a progressive Node.js framework for building efficient and scalable applications.
- **Robust Database**: Uses PostgreSQL for data persistence.
- **Fully Typed**: Written in TypeScript for safer and more maintainable code.
- **Dockerized**: Complete setup with `Dockerfile` and `docker-compose.yml` for a consistent development and production environment.
- **Efficient Package Manager**: Uses pnpm for fast and space-efficient dependency management.

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### ✅ Prerequisites

Make sure you have the following installed on your system:

- Node.js (v20 o superior)
- pnpm
- Docker
- Docker Compose

### 📦 Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/inventify.git
    cd inventify
    ```

2.  **Install dependencies:**
    ```bash
    pnpm install
    ```

3.  **Environment Setup (for local development without Docker):**

    Create a `.env` file in the project root. You can use the `.env.example` file as a template:
    ```bash
    cp .env.example .env
    ```
    Adjust the variables inside `.env` if necessary for your local PostgreSQL setup.

---

## 🐳 Running with Docker

The easiest way to get the entire environment (API + Database) up and running is by using Docker Compose. The environment variables for the database connection are already configured in the `docker-compose.yml` file for container-to-container communication.

1.  **Build and start the containers:**
    ```bash
    docker-compose up --build
    ```
    - The `--build` flag will rebuild the API image if you've made changes to the code.
    - To run in the background, add the `-d` flag: `docker-compose up --build -d`.

2.  **Access the application:**
    - The API will be available at `http://localhost:3000`.
    - The API documentation (Swagger) will be available at `http://localhost:3000/api`.

3.  **To stop the services:**
    ```bash
    docker-compose down
    ```

---

## 💻 Available Scripts

In the `package.json`, you will find several useful scripts:

- **Run in development mode (with hot-reloading):**
  ```bash
  pnpm run start:dev
  ```

- **Construir la aplicación para producción:**
  ```bash
  pnpm run build
  ```

- **Ejecutar la aplicación en producción (después de construir):**
  ```bash
  pnpm run start:prod
  ```

- **Ejecutar tests unitarios:**
  ```bash
  pnpm run test
  ```

- **Ejecutar tests e2e:**
  ```bash
  pnpm run test:e2e
  ```

- **Linting y formateo:**
  ```bash
  pnpm run lint
  pnpm run format
  ```

---

## 📄 Licencia

Este proyecto no tiene una licencia especificada.