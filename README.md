# MoviesHub 🎬

MoviesHub is a full-stack movie application powered by **C# ASP.NET Core** (backend) and **Angular** (frontend), deployed on **Azure Kubernetes Service (AKS)** using **Terraform** and **Kubernetes manifests**. It uses **MS SQL Server** as the database.

## Project Structure

```
/movieshub
  ├── /backend                  # C# ASP.NET Core backend
  │     ├── Dockerfile          # Containerizes the backend
  │     ├── MoviesHubApi/       # Backend application source code
  │
  ├── /frontend                 # Angular frontend
  │     ├── Dockerfile          # Containerizes the frontend
  │     ├── src/                # Frontend application source code
  │
  ├── /k8s                      # Kubernetes manifests for deployment
  │     ├── backend-deployment.yaml  # Defines backend Deployment & Service
  │     ├── frontend-deployment.yaml # Defines frontend Deployment & Service
  │     ├── mssql-deployment.yaml    # Deploys MS SQL Server on AKS
  │     ├── ingress.yaml        # Optional: Configures Ingress for domain-based routing
  │
  ├── /terraform                # Infrastructure as Code (IaC) using Terraform
  │     ├── /environments       # Separate environments for staging, production, etc.
  │     │     ├── dev/          # Dev environment Terraform configs
  │     │     │     ├── main.tf
  │     │     │     ├── variables.tf
  │     │     │     ├── outputs.tf
  │     │     │     ├── terraform.tfvars
  │     │     ├── prod/         # Production environment Terraform configs
  │     │     │     ├── main.tf
  │     │     │     ├── variables.tf
  │     │     │     ├── outputs.tf
  │     │     │     ├── terraform.tfvars
  │     │
  │     ├── /modules            # Reusable Terraform modules
  │     │     ├── acr/          # Azure Container Registry module
  │     │     │     ├── main.tf
  │     │     │     ├── outputs.tf
  │     │     │     ├── variables.tf
  │     │     ├── aks/          # Azure Kubernetes Service module
  │     │     │     ├── main.tf
  │     │     │     ├── outputs.tf
  │     │     │     ├── variables.tf
  │     │     ├── networking/   # Manages VPC, subnets, security groups
  │     │     │     ├── main.tf
  │     │     │     ├── variables.tf
  │     │     │     ├── outputs.tf
  │     │     ├── sql/          # SQL module
  │     │     │     ├── main.tf
  │     │     │     ├── outputs.tf
  │     │     │     ├── variables.tf
  │     │
  │     ├── backend.tf          # Remote state configuration (Azure Storage)
  │     ├── providers.tf        # Defines Terraform providers (AzureRM, Helm, Kubernetes)
  │     ├── terraform.tfvars    # Global Terraform variables (ignored in Git)
  │     ├── versions.tf         # Enforces Terraform versioning
  │
  ├── /docs                     # Documentation
  │     ├── README.md           # Project documentation
  │     ├── architecture.md     # System design overview
```

## 🚀 Getting Started

### Prerequisites
- **Azure CLI**
- **Kubectl**
- **Terraform**
- **Docker**
- **.NET 7+**
- **Node.js & Angular CLI**
- **Azure SQL Server or MSSQL in AKS**

### 1️⃣ Deploy Infrastructure (AKS)
```sh
cd terraform
terraform init
terraform apply -auto-approve
```

### 2️⃣ Deploy MS SQL Server to AKS
```sh
kubectl apply -f k8s/mssql-deployment.yaml
```
#### Verify MSSQL Pod & Service:
```sh
kubectl get pods
kubectl get svc
```
Copy the `mssql-service` IP for database connections.

### 3️⃣ Configure Backend for MSSQL
Update **appsettings.json** in `backend/MoviesHubApi/`:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=mssql-service;Database=MoviesHubDB;User Id=sa;Password=YourStrong!Passw0rd;"
}
```

### 4️⃣ Build & Push Docker Images
#### Backend:
```sh
cd backend
docker build -t myacr.azurecr.io/csharp-backend:latest .
docker push myacr.azurecr.io/csharp-backend:latest
```
#### Frontend:
```sh
cd frontend
docker build -t myacr.azurecr.io/angular-frontend:latest .
docker push myacr.azurecr.io/angular-frontend:latest
```

### 5️⃣ Deploy App to AKS
```sh
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/frontend-deployment.yaml
```

### 6️⃣ Access the App
Run:
```sh
kubectl get svc
```
Copy the external IP of `frontend-service` and open it in a browser. 🎉

## 📌 Features
- 🎬 Movie browsing & search
- 📝 User reviews & ratings
- 🔐 Secure authentication
- 🗄 MS SQL Server database
- 🚀 Scalable Kubernetes deployment

## 🛠 Future Enhancements
- CI/CD pipeline with GitHub Actions
- Movie recommendation system

## 📜 License
MIT License
# terraform-kubernetes
