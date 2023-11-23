pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // Checks out the source code from the configured SCM repository
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                // Use the Makefile to build and push the Docker image
                sh 'make all'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // Deploy to Kubernetes using kubectl
                script {
                    sh "kubectl apply -f path/to/your/deployment.yaml"
                }
            }
        }
    }

    post {
        always {
            // Steps to clean up or finalize, run after the pipeline steps
            sh "echo 'Job completed'"
        }
        failure {
            // Steps to perform on failure
            sh "echo 'Job failed'"
        }
    }
}

