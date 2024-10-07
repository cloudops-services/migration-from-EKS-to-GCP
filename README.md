# Kubernetes to App Engine Migration by CloudOps

[cloudops-services.com](http://cloudops-services.com)  
Free for personal and commercial use under the MIT license (cloudops-services.com/license)

This project walks through the process of migrating an application from a Kubernetes cluster to Google App Engine using Terraform to manage infrastructure as code. You will:

- Set up a Kubernetes infrastructure (simulated for this demo).
- Deploy the application on Kubernetes.
- Create an App Engine environment on GCP.
- Deploy the application to App Engine.
- Migrate any necessary data.
- Tear down the Kubernetes infrastructure.

This approach is ideal when you want to move away from something highly customizable but complex, such as Kubernetes, to a fully managed and easy-to-use platform like Google App Engine. By doing this, you can reduce the operational burden and focus more on application development.

Hope you find this guide helpful :)

**AJ**  
admin@cloudops-services.com | @cloudops

---

## Requirements:

- **Google Cloud SDK** (`gcloud`).
- **Terraform**.
- **Docker**.

---

## Steps:

### 1. Kubernetes Infrastructure Setup and Application Deployment (For Demo Purposes)

This step simulates a complex Kubernetes setup. If you already have a running Kubernetes cluster, you can skip this.

Navigate to the Kubernetes infrastructure directory and apply the Terraform configuration to create a Kubernetes cluster:

```bash
cd infraestructure/kubernetes_infrastructure
terraform init
terraform apply
```

Deploy the application to the Kubernetes cluster using kubectl:

```bash
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
```

Check the application status:

```bash
kubectl get pods
kubectl get svc
```

### 2. Prepare the Application for Google App Engine

Navigate to the GCP infrastructure directory:

```bash
cd infraestructure/gcp_infrastructure
terraform init
terraform apply
```

This will create the necessary Google App Engine environment.

### 4. Deploy the Application to Google App Engine

Run the deployment script to upload the application to Google App Engine:

```bash
./scripts/deploy_app.sh <project_id>
```

Verify that the application is running on App Engine:

```bash
gcloud app browse
```

### 5. Data Migration (If Needed)

To transfer data from the Kubernetes environment to GCP:

Export data from the Kubernetes environment:

```bash
kubectl cp <pod_name>:/path/to/data ./local-directory/
```

Import the data into Google Cloud Storage or a GCP-managed database as needed.

### 6. Tear Down Kubernetes Infrastructure

If you used the simulated Kubernetes environment, navigate back to the Kubernetes infrastructure directory:

```bash
cd ../kubernetes_infrastructure
```

Destroy the Kubernetes resources:

```bash
terraform destroy
```
