pipeline {
  agent any

  parameters {
    choice(name: 'ENV', choices: ['dev', 'staging', 'prod'], description: 'Target deployment environment')
    booleanParam(name: 'APPLY', defaultValue: false, description: 'Run terraform apply')
  }

  environment {
    TF_IN_AUTOMATION = 'true'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Init') {
      steps {
        dir("environments/${params.ENV}") {
          sh 'terraform init -input=false'
        }
      }
    }

    stage('Validate') {
      steps {
        dir("environments/${params.ENV}") {
          sh 'terraform fmt -check'
          sh 'terraform validate'
        }
      }
    }

    stage('Plan') {
      steps {
        dir("environments/${params.ENV}") {
          sh 'terraform plan -out=tfplan -input=false'
        }
      }
    }

    stage('Apply') {
      when {
        expression { return params.APPLY }
      }
      steps {
        dir("environments/${params.ENV}") {
          sh 'terraform apply -auto-approve tfplan'
        }
      }
    }
  }
}
