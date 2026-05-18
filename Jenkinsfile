pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {

        stage('Set Environment') {

            steps {

                script {

                    if (env.BRANCH_NAME == "dev") {
                        ENV_DIR = "environments/dev"
                    }

                    else if (env.BRANCH_NAME == "main") {
                        ENV_DIR = "environments/prod"
                    }

                    else {
                        error("Unsupported branch")
                    }
                }
            }
        }

        stage('Checkout Code') {
            steps {
               git branch: env.BRANCH_NAME,
               url: 'https://github.com/NiranjanReddy19/Devops_Task.git',
               credentialsId: 'github-credentials'
            }
        }

        stage('Terraform Init') {
            steps {
               dir(env.ENV_DIR) {
                 sh 'terraform init'
            }
         }
      }

        stage('Terraform Format Check') {
            steps {
               dir(env.ENV_DIR) {
                 sh 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                dir(env.ENV_DIR) {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir(env.ENV_DIR) {
                    sh 'terraform plan -var-file=terraform.tfvars'
                }
            }
        }

        stage('Manual Approval for PROD') {

            when {
                branch 'main'
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