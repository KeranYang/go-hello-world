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

        stage('Deploy to Kubernetes and Test') {
            steps {
                script {
                    // Deploy the application to Kubernetes
                    sh "kubectl apply -f kubernetes/deployment.yaml"

                    // Wait for the deployment to be ready
                    sh "kubectl rollout status deployment/go-hello-world --timeout=2m"

                    // Get the pod name
                    POD_NAME = sh(returnStdout: true, script: "kubectl get pods -l app=go-hello-world -o jsonpath='{.items[0].metadata.name}'").trim()

                    // Check the output of the pod
                    def podOutput = sh(returnStdout: true, script: "kubectl logs $POD_NAME").trim()

                    // Validate the output
                    if (podOutput == "KeranYang - Hello, World!") {
                        echo "Pod output is valid"
                    } else {
                        error "Pod output is invalid"
                    }
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

