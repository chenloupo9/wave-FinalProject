#! /bin/bash
sudo apt install curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" 
sudo apt update 
sudo apt install terraform 
terraform -install-autocomplete 
source /home/dev/.bashrc 
