pipeline {
    agent any

    environment {
        // This will inject both AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
        AWS_DEFAULT_REGION = 'ap-south-1'
        PATH = "C:\\Program Files\\Terraform;${env.PATH}"
    }
    // corrected the file name
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git branch: 'main', url: 'https://github.com/Nglicloud/terraformproject.git'
            }
        }
        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-jenkins']]) {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-jenkins']]) {
                    bat 'terraform plan -var-file="terraform.tfvars"'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Proceed with Terraform Apply?"
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-jenkins']]) {
                    bat 'terraform destroy -auto-approve -var-file="terraform.tfvars"'
                }
            }
        }
    }
}
// updated the Terraform version