# Terraform-Automated-Linux-Bootstrap-on-Azure

## Project Overview

This project provisions a fully automated Linux VM environment on Microsoft Azure using Terraform and cloud-init.

The VM automatically configures:

- Nginx
- Docker
- Azure Monitor Agent
- Secure SSH
- Health check scripts
- Startup automation
- Custom HTML deployment
- Logging

---

# Architecture

Terraform → Azure VM → cloud-init → Install & Configure Services

---

# Technologies Used

- Terraform
- Microsoft Azure
- Ubuntu Linux
- cloud-init
- Docker
- Nginx
- Azure Monitor Agent

---

# Project Structure

```text
terraform-automated-linux-bootstrap-on-azure/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── network.tf
├── security.tf
├── vm.tf
├── monitor.tf
│
├── cloud-init/
│   ├── cloud-init.tpl
│   ├── custom-index.html
│   └── health-check.sh
│
├── scripts/
│   └── startup.sh
│
└── README.md
```

---

# Prerequisites

- Azure Subscription
- Terraform Installed
- Azure CLI Installed
- SSH Key Pair

---

# Setup Instructions

## 1. Clone Repository

```bash
git clone <repo-url>
cd terraform-automated-linux-bootstrap-on-azure
```

## 2. Login to Azure

```bash
az login
```

## 3. Initialize Terraform

```bash
terraform init
```

## 4. Validate Configuration

```bash
terraform validate
```

## 5. Plan Infrastructure

```bash
terraform plan
```

## 6. Deploy Infrastructure

```bash
terraform apply -auto-approve
```

---

# SSH Access

```bash
ssh -i ~/.ssh/bootstrap_key azureuser@PUBLIC_IP
```

---

# Verify Services

## Verify Nginx

```bash
systemctl status nginx
```

## Verify Docker

```bash
systemctl status docker
```

## Verify Health Check

```bash
bash /usr/local/bin/health-check.sh
```

Expected Output:

```json
{ "nginx_status": "active" }
```

---

# Verify Website

Open browser:

```text
http://PUBLIC_IP
```

Expected:

Linux Bootstrap Completed Successfully

---

# Logging

## Startup Logs

```bash
cat /var/log/startup.log
```

## Bootstrap Logs

```bash
cat /var/log/custom/bootstrap.log
```

---

# Security Features

- SSH Key Authentication
- Disabled Root Login
- Disabled Password Authentication
- NSG Rules for Controlled Access

---

# Common Issues

## Nginx Service Missing

Cause:
Broken cloud-init YAML indentation.

Fix:
Use Terraform indent() function inside vm.tf.

---

# Destroy Infrastructure

```bash
terraform destroy -auto-approve
```

---

# Key Learning Outcomes

- Infrastructure as Code
- Azure VM Automation
- cloud-init Bootstrapping
- Terraform templatefile()
- Linux Service Management
- SSH Security
- DevOps Troubleshooting

---

# Author

Project: Terraform-Automated-Linux-Bootstrap-on-Azure
