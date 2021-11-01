#! /bin/bash
sudo apt install curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" 
sudo apt update 
sudo apt install terraform 
terraform -install-autocomplete 
source /home/dev/.bashrc 
echo export AWS_ACCESS_KEY_ID=AKIA6ANAZ5ES5LK2NG4U >> ~/.bashrc
echo export AWS_SECRET_ACCESS_KEY=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 >> ~/.bashrc
echo export AWS_DEFAULT_REGION=eu-central-1 >> ~/.bashrc
source ~/.bashrc
