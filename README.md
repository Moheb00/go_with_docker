# Go HTTP Server with Docker

Simple Go web server containerized using Docker.

## Features

* Written in Go 1.20
* Dockerized application
* Multi-stage Docker build
* Lightweight Alpine image
* Healthcheck support
* Non-root container user

---

## Project Structure

```bash
.
├── Dockerfile
├── go.mod
└── main.go
```

---

## Requirements

* Docker
* Go 1.20 (optional if using Docker only)

---

## Run Locally

### Clone repository

```bash
git clone https://github.com/Moheb00/go_with_docker.git
cd go_with_docker
```

### Run using Go

```bash
go run main.go
```

Server starts on:

```text
http://localhost:8080
```

---

## Build Docker Image

```bash
docker build -t go-server .
```

---

## Run Docker Container

```bash
docker run -p 8080:8080 go-server
```

---

## Test Endpoint

Open in browser:

```text
http://localhost:8080/test
```

Expected response:

```text
Hello, you've requested: /test
```

---

## Docker Features

### Multi-stage Build

The Dockerfile uses a builder stage to reduce final image size.

### Healthcheck

Container health is verified using:

```bash
wget --spider http://localhost:8080/
```

### Security

The application runs using a non-root user inside the container.

---

## Technologies Used

* Go
* Docker
* Alpine Linux

---

## Author

Moheb Ayman
