#! /bin/bash
sudo apt install curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" 
sudo apt update 
sudo apt install terraform 
terraform -install-autocomplete 
source /home/dev/.bashrc 
echo export AWS_ACCESS_KEY_ID="<your_access_key>" >> ~/.bashrc
echo export AWS_SECRET_ACCESS_"<your_secret_key" >> ~/.bashrc
echo export AWS_DEFAULT_REGION=eu-central-1 >> ~/.bashrc
source ~/.bashrc
