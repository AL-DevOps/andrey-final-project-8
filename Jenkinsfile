pipeline {
        agent {
        label "Terraform-Ansible"
    }
    stages {
        stage('Checkout code') {
            steps {
         
                cleanWs()
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/AL-DevOps/andrey-final-project-terraform-ansible-EKS.git']]]) 
            }
        }

        stage('Terraform apply') {
            steps {
                sh 'terraform init'
                sh 'terraform apply --auto-approve'
            }
        }
        
        stage('Read claster_name from terraform outputs') {
            steps {
                script {
                    def claster_name_terraform = sh(returnStdout: true, script: "terraform output cluster_name").trim()
                    println(claster_name_terraform)
                    sh """aws eks --region eu-central-1 update-kubeconfig --name $claster_name_terraform"""
                }
            }
        }
        
        stage('Deployment-Service apply') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }        

    }
}    
