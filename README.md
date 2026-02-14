# Todo API: End-to-End DevOps Pipeline

This project demonstrates a complete software lifecycle, from local development to automated deployment on AWS. The primary focus was building a robust, production-ready environment that leverages automation to ensure code quality and deployment speed.

### 🏗️ Infrastructure Architecture
The project provisions a highly available AWS deployment using Terraform.
* **VPC Architecture**: A complete VPC featuring public and private subnets across multiple availability zones.
* **Connectivity**: Includes an Internet Gateway for public access and a NAT Gateway to provide secure outbound connectivity for private resources.

![AWS Resource Map](IMG/Screenshot%202026-02-13%20211645.png)
### 🛠️ Technical Stack
* **Application**: Built with Python and the Flask framework.
* **Infrastructure as Code (IaC)**: Managed and provisioned using Terraform.
* **Containerization**: The application is containerized using Docker to ensure environment consistency across development and production.
* **CI/CD**: Orchestrated via GitHub Actions for automated linting, testing, and deployment.

### 🚀 The CI/CD Journey
The pipeline is designed to automate every step from code commit to production:
1.  **Continuous Integration (CI)**: Triggers automated testing using Pytest, including logic validation and code coverage reporting.
2.  **Container Management**: Builds a Docker image and pushes it to Docker Hub upon successful tests.
3.  **Continuous Deployment (CD)**: Automatically deploys the latest container to an EC2 instance via SSH and Docker Compose.

![Project Architecture Workflow](IMG/Screenshot%202026-02-14%20090141.png)

### 📈 Automation Results
The implementation ensures that no code reaches production without passing the defined quality gates.

![GitHub Actions Success](IMG/Screenshot%202026-02-13%20211716.png)
