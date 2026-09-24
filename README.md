# Web Application Deployment on Amazon EKS

## 📌 Overview

This project demonstrates deploying a containerized web application on **Amazon EKS using Kubernetes**. The Docker image is stored in **Amazon ECR**, deployed using a Kubernetes **Deployment**, and exposed publicly using a **LoadBalancer Service**.

## 🏗️ Architecture

```text
Web Application
      ↓
    Docker
      ↓
   Amazon ECR
      ↓
   Amazon EKS
      ↓
Kubernetes Deployment
      ↓
  2 Pods
      ↓
Kubernetes LoadBalancer Service
      ↓
   Web Application
```

## 🛠️ Prerequisites

* AWS CLI
* Docker
* Terraform
* kubectl
* Amazon EKS Cluster
* EKS Node Group
* Amazon ECR Repository

## 🚀 Deployment Steps

### 1. Build Docker Image

```bash
docker build -t eks-web-app .
```

### 2. Push Image to Amazon ECR

```bash
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com

docker tag eks-web-app:latest \
<AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/eks-web-app:latest

docker push \
<AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/eks-web-app:latest
```

### 3. Deploy to EKS

Apply the Kubernetes Deployment:

```bash
kubectl apply -f deployment.yaml
```

Apply the LoadBalancer Service:

```bash
kubectl apply -f service.yaml
```

Verify the deployment:

```bash
kubectl get pods
kubectl get deployments
kubectl get services
```

The Deployment runs **2 replicas** for basic redundancy, and the LoadBalancer exposes the application publicly.

## 🌐 Application URL

[**Open Deployed Web Application**](http://ab3d6941ae66d45aebed0d4a6ecb5a53-371752692.us-east-1.elb.amazonaws.com)

## 🔧 Technologies

* **AWS EKS** – Kubernetes cluster
* **Amazon ECR** – Container image repository
* **Kubernetes** – Container orchestration
* **Docker** – Containerization
* **Terraform** – Infrastructure as Code
* **kubectl** – Kubernetes management

## ✅ Result

Successfully deployed and exposed a containerized web application on **Amazon EKS** using Kubernetes Deployment and LoadBalancer Service.
