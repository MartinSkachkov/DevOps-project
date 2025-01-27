# FastAPI Application Deployment Project

A complete DevOps project that demonstrates the deployment of a FastAPI application using Docker, GitHub Actions, Terraform, and Ansible. The project includes automated CI/CD, infrastructure as code, and configuration management. It is designed for learning purposes. To check the final result click [here](http://3.75.202.103/).

## Project Overview

The project consists of:

- A FastAPI application with two endpoints
- Containerization using Docker
- Automated CI/CD pipeline using GitHub Actions
- Infrastructure provisioning with Terraform
- Deployment automation with Ansible

## Technical Stack

### Application Layer

- **FastAPI**: Python web framework for building APIs
- **Python 3.9**: Base programming language
- **Uvicorn**: ASGI web server implementation for Python
- **Socket**: Python library for hostname retrieval

### Infrastructure Layer

- **AWS EC2**: t2.micro instance in eu-central-1 region
- **Security Groups**: Configured for HTTP (80) and SSH (22) access
- **AMI**: Amazon Linux 2 (ami-085131ff43045c877)

### DevOps Tools

- **Docker**: Application containerization
  - Base image: python:3.9-slim
  - Exposed port: 80
- **GitHub Actions**: CI/CD pipeline
  - Automated builds on push to main branch
  - Container registry: GitHub Container Registry (ghcr.io)
- **Terraform**: Infrastructure as Code
  - Provider: AWS (eu-central-1)
  - Resources: EC2, Security Groups
  - note: Terraform configuration uses a profile named "terraform-user"
- **Ansible**: Configuration management
  - System package installation
  - Docker installation and configuration
  - Container deployment

## Project Structure

```
project-root/
├── app/
│   └── main.py
├── .github/
│   └── workflows/
│       └── docker-build.yml
├── terraform/
│   ├── ec2.tf
├── ansible/
│   └── playbook.yml
├── Dockerfile
├── .dockerignore
├── .gitignore
├── requirements.txt
└── README.md

```

## API Endpoints

1. Root Endpoint

   - Path: `/`
   - Method: `GET`
   - Response: `{"message": "Hello World"}`

2. Hostname Endpoint
   - Path: `/hostname`
   - Method: `GET`
   - Response: `{"hostname": "<current_hostname>"}`

## Infrastructure Details

### Security Group Configuration

- Inbound Rules:
  - HTTP (Port 80) - Open to all
  - SSH (Port 22) - Open to all
- Outbound Rules:
  - All traffic allowed

### EC2 Instance

- Type: t2.micro (Free tier eligible)
- Region: eu-central-1
- Public IP: Enabled
- Key Pair: putty-console

## CI/CD Pipeline

The GitHub Actions workflow (`docker-image.yml`) performs the following steps:

1. Checks out the repository code
2. Logs in to GitHub Container Registry
3. Extracts metadata for Docker image
4. Builds and pushes the Docker image with appropriate tags

## Ansible Deployment

The Ansible playbook (`playbook.yml`) handles:

1. System package installation including:
   - Docker dependencies
   - Python requirements
2. Docker installation and service configuration
3. Container deployment with:
   - Automatic restart policy
   - Port mapping (80:80)
   - Latest image from GitHub Container Registry

## Resources

Here are some resources that helped me learn and develop this project.

### FastAPI

- [Python FastAPI Tutorial](https://www.youtube.com/watch?v=iWS9ogMPOI0)

### Docker

- [Docker Full Course - Learn Docker in 1 Hour](https://www.youtube.com/watch?v=pg19Z8LL06w)

### GitHub Actions

- [GitHub Actions Full Course - Automate Your Workflow](https://www.youtube.com/watch?v=R8_veQiYBjI)

### Terraform

- [Terraform Tutorial for Beginners | Learn Infrastructure as Code](https://www.youtube.com/watch?v=l5k1ai_GBDE)
- [Terraform Tutorial Series - Playlist](https://www.youtube.com/playlist?list=PL184oVW5ERMDGN0a7yowSQiH4qjsTeE5g)
- [How to Create an EC2 Instance Using Terraform](https://www.youtube.com/watch?v=GX-iYiKiH94)
- [Stop or Terminate an Amazon EC2 Instance](https://www.youtube.com/watch?v=w9kgSlYNL4A)

### Ansible

- [Ansible for Beginners | Complete Guide](https://www.youtube.com/watch?app=desktop&v=1id6ERvfozo&t=253s)
- [How to install Ansible on Windows using WSL](https://www.youtube.com/watch?v=52ErTSw79eg)
- [How to Create a Keypair, Launch, and SSH Into an AWS EC2 Instance](https://www.youtube.com/watch?v=yPdmy--Uh50)
