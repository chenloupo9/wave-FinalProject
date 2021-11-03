# AWS-EKS-cluster 
The files in side this directory will create using terraform an vpc with public and private subnets fully configured, an EKS cluster with worker node using spot instances on private subnets with autoscaling set for desired size at 2, max size at 10 and min size at 1. 

**The terraform file contain**
- vpc.tf (creates vps, 2 public subnets, 2 private subnets, 2 availability zones, IGW , NAT, route tables, route tables association) 
- nat.tf (creates the NAT-gateway for the private subnets)
- provider.tf (the provider we will be using, in this case aws) 
- vars.tt (Variables used within different files))
- eks-worker-node-iam.tf (creates an iam role for the worker-node and attach it the specific policies) 
- eks-node-group.tf (creates node group for the worker nodes) 
- eks-cluster-iam.tf (create an iam policy for the eks-cluster and attach the specific policies) 
- EKS-cluster.tf (creates an EKS-cluster) 

## Quick Start 
### 1. Export your aws access key and secret key 
``` 
export AWS_ACCESS_KEY="<aws_access_key>" 
export AWS_SECRET_KEY="<aws_secret_key>" 
``` 

### 2. Clone git repository 
```
git clone https://github.com/chenloupo9/wave-FinalProject.git 
```
- Make sure terraform is installed or use the script to install it 
```
cd wave-FinalProject
cd files 
bash terraform-installition.sh
``` 

### 3. Run Terraform files as follow 
```
cd 2-eks-cluster 
terraform init 
terraform plan 
terraform apply -auto-approve
```

 
