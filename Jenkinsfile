pipeline {

    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-credentials', url: 'https://github.com/NiranjanReddy19/Devops_Task.git']])
            }
        }

        stage('Set Environment') {

            steps {

                script {

                    if (env.JOB_NAME == "terraform-dev-pipeline") {
                        ENV_DIR = "environments/dev"
                    }

                    else if (env.JOB_NAME == "terraform-prod-pipeline") {
                        ENV_DIR = "environments/prod"
                    }

                    else {
                        error("Unknown Job")
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh """
                cd ${ENV_DIR}
                terraform init
                """
            }
        }

        stage('Terraform Validate') {
            steps {
                sh """
                cd ${ENV_DIR}
                terraform validate
                """
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                cd ${ENV_DIR}
                terraform plan -var-file=terraform.tfvars
                """
            }
        }

        stage('Approval For PROD') {

            when {
                expression {
                    env.JOB_NAME == "terraform-prod-pipeline"
                }
            }

            steps {
                input "Approve Production Deployment?"
            }
        }

        stage('Terraform Apply') {
            steps {
                sh """
                cd ${ENV_DIR}
                terraform apply -auto-approve -var-file=terraform.tfvars
                """
            }
        }
    }
}