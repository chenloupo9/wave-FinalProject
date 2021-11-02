# AWS-EKS-cluster 
The files in side this directory will create using terraform an vpc with public and private subnets fully configured, an EKS cluster with node group using spot instances and autoscaling. 

**The terraform file contain*
- vpc.tf (creates vps, 2 public subnets, 2 private subnets, 2 availability zones, IGW , NAT, route tables, route tables association) 
- provider.tf (the provider we will be using, in this case aws) 
 


 
