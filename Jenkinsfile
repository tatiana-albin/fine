pipeline {
    agent any
    environment {
        dockerhub=credentials('docker-hub-token')
    }
    stages {
        stage('checkout') {
            steps {
                checkout scm
            }
        }
        stage('build') {
            steps {
                sh 'make demo-app-build'
            }
        }
        stage('push') {
            steps {
                // sh "env"
                sh "docker logout"
                sh "echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin docker.io"
                sh 'make demo-app-push'
            }
        }
        stage('test') {
            steps {
                sh "echo Executing testing stage..."
                
            }
        }
        stage('deploy') {
            steps {
                sh "echo Executing deployment stage..."
                sshagent(['devops']) {
    				sh "scp -o StrictHostKeyChecking=no docker-compose.yml ec2-user@3.72.34.63:/home/ec2-user/"
    				script{
    					try{
    						sh "ssh ec2-user@3.72.34.63 kubectl apply -f ."
    					}catch(error){
    						sh "ssh ec2-user@3.72.34.63 kubectl create -f ."
    					}
    			}
            }
        }
        
    }
}
