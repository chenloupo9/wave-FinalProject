# AWS-Static-Website 
The files inside this directory will create using terraform an vpc with public and private subnets fully configured,EC2 instances,security groups,auto-scaling group, and an Application Load Balancer.Then using Ansible playbook build an docker image and a docker container running a simple nginx webpage.
 
**The Terraform files contain** 
-  vpc.tf (creates vps, 2 public subnets, 2 private subnets, 2 availability zones, IGW , NAT, route tables, route tables association)
- provider.tf (the provider we will be using, in this case aws)
- vars.tf (Variables used within different files) 
- securitygroup.tf (creates the security groups for the ec2 instances and the ALB)
- nat.tf (creates the NAT-Gateway for the private instances) 
- instance.tf (creates 3 ec2 instances, 1 in the public subnet and 2 in the private subnets)
- output.tf (show the output of the instances ip address and the ALB) 
- alb.tf (creates an alb that will route traffic to the private instances) 

## Quick Start 
### 1. Export your aws access key and secret key 
``` 
export AWS_ACCESS_KEY="<aws_access_key>" 
export AWS_SECRET_KEY="<aws_secret_key>"
export AWS_DEFAULT_REGION=eu-central-1 
``` 

### 2. Clone git repository 
```
git clone https://github.com/chenloupo9/wave-FinalProject.git 
```
- Make sure terraform is installed or use the script to install it 
```
cd ~/wave-FinalProject/files/ 
bash terraform-installition.sh
``` 

### 3. Create an ssh-key named aws_key inside 1-website directory 
```
cd ~/wave-FinalProject/1-website/
ssh-keygen
``` 

### 4. Run Terraform files as follow 
``` 
terraform init 
terraform plan
terraform apply -auto-approve 
``` 

### 5. Find the public address of bastion-instance
```
terraform output
```

### 6. Login to bastion-instance with the public address
```
ssh -i aws_key ubuntu@<public-ip>
```

### 7. Update and install ansible
```
sudo apt update && sudo apt install ansible -y 
```

### 8. Go to the ansibel directory and check that you can ping the private-instances
```
cd ansible
ansible all -i inventory -m ping -b -u ubuntu
```

### 9. Run the ansible-playbook docker-demo.yaml
```
ansible-playbook docker-demo.yaml
```

### 10. Copy the dns-name of the Application Load Balancer to the browser
```
cat ~/alb-name
```

- you should see the web-page running

**To destory all the resources that were created you need to exit the bastion-instance**
```
cd 
exit
```

**make sure you are at the right directory (you should be at /home/ubuntu/wave-FinalProject/1-website), and run the terraform command
```
terraform destroy -auto-approve
```







