pipeline {
    agent any

    environment {
        IMAGE = "myregistry.azurecr.io/ai-devops-demo:${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                sh "docker build --progress=plain -t $IMAGE ."
            }
        }

        stage('Verify Image') {
            steps {
                sh "docker images $IMAGE"
            }  
        }
    }

    post {
        always {
            cleanWs()
        }
        failure {
            echo 'Build failed. Check the Console Output above for details.'
        }
    }
}