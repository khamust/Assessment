
This project is a simple Node.js application connected to a Postgres database. It’s containerized with Docker, orchestrated using Docker Compose, and includes a GitHub Actions pipeline for CI/CD. The focus is on demonstrating good practices in security, deployment, and observability — even without a live cloud account.

## Running the App Locally
1. Clone the repository
   git clone https://github.com/your-username/assessment.git
   cd assessment

2. Create a `.env` file** in the project root with your database settings:
   
   POSTGRES_USER=youruser
   POSTGRES_PASSWORD=yourpassword
   POSTGRES_DB=yourdb

3. Start the app and database with Docker Compose
   docker-compose up --build

4. Access the app 
   - Application: open `http://localhost:3000` in your browser.  
   - Health check: `http://localhost:3000/health` (returns “OK” if the app is healthy).  
   - Database: runs locally on port `5432`.

## Deployment
Since there’s no AWS account or custom domain, deployment is demonstrated in two ways:

Local Deployment 
  Using Docker Compose, the app and database run together on your machine. This simulates how containers would run in production.

- CI/CD Simulation:  
  GitHub Actions workflows (`ci.yml` and `deploy.yml`) are included to show how builds and deployments would be automated.  
  - `ci.yml` builds and tests the app, then builds the Docker image.  
  - `deploy.yml` runs Terraform commands, but since there’s no AWS account, it acts as a placeholder to demonstrate the process.
Key Decisions

- Secrets (like database credentials) are stored in `.env` files locally and in GitHub Secrets for CI/CD.  
- No secrets are hard‑coded in code or workflows.  
- The app runs as a **non‑root user** inside the container for safety.
 CI/CD
- GitHub Actions is used to automate builds and deployments.  
- Manual approval is required before the deploy workflow runs, simulating safe production practices.  
- Workflows are split into build and deploy stages for clarity.

#Infrastructure
- Terraform files are included to show how infrastructure would be defined as code.  
- Even without AWS, the structure demonstrates how you will provision resources like load balancers and databases.  

 Observability
- Basic logging is done with `console.log()` in the Node.js app.  
- A `/health` endpoint is available for monitoring.  
- Docker Compose includes a healthcheck to automatically restart the app if it fails.

This project demonstrates:
- A secure, containerized Node.js app with Postgres.  
- CI/CD pipelines using GitHub Actions.  
- Infrastructure as Code with Terraform (design only, no live AWS).  
- Deployment strategies and observability practices, adapted to a local environment.  

