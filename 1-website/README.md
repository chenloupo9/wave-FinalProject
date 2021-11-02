# AWS-Static-Website 
The files inside this directory will create using terraform an vpc with public and private subnets fully configured,EC2 instances,security groups,auto-scaling group, and an Application Load Balancer.Then using Ansible playbook build an docker image and a docker container running a simple nginx webpage.
 
**The Terraform files contain** 
-  vpc.tf (creates vps, 2 public subnets, 2 private subnets, 2 availability zones, IGW , NAT, route tables, route tables association)
- provider.tf (the provider we will be using, in this case aws)
- vars.tf (Variables used within different files) 
- securitygroup.tf (creates the security groups for the ec2 instances and the ALB)
- nat.tf (creates the NAT-Gateway for the private instances) 
- autoscaling.tf (create an autoscaling group for the instances) 
- instance.tf (creates 3 ec2 instances, 1 in the public subnet and 2 in the private subnets)
- output.tf (show the output of the instances ip address and the ALB) 
- alb.tf (creates an alb that will route traffic to the private instances) 





