pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop myapp-container || true
                docker rm myapp-container || true
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d --name myapp-container -p 80:80 myapp:latest'
            }
        }
    }
}
