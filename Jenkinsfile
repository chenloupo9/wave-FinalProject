#!/usr/bin/env groovy
node {
    def commit_id
    stage('Prepare') {
        git 'https://github.com/chenloupo9/wave-FinalProject.git'
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id')
    }
    
    stage('docker Build') {
        sh 'docker build -t python-app .'
		sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 962946787621.dkr.ecr.eu-central-1.amazonaws.com'
		sh 'docker tag docker tag demo-repo:latest 962946787621.dkr.ecr.eu-central-1.amazonaws.com/demo-repo:${commit-id}'
		sh 'docker push 962946787621.dkr.ecr.eu-central-1.amazonaws.com/demo-repo:${commit_id}'
         }	
    }
