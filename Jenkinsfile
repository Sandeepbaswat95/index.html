pipeline {
agent any

```
environment {
    IMAGE_NAME = "myapp"
    CONTAINER_NAME = "myapp-container"
}

stages {

    stage('Checkout') {
        steps {
            checkout scm
        }
    }

    stage('Build Docker Image') {
        steps {
            sh '''
            docker build -t ${IMAGE_NAME}:latest .
            '''
        }
    }

    stage('Remove Old Container') {
        steps {
            sh '''
            docker rm -f ${CONTAINER_NAME} || true
            '''
        }
    }

    stage('Run New Container') {
        steps {
            sh '''
            docker run -d \
            --name ${CONTAINER_NAME} \
            -p 80:80 \
            ${IMAGE_NAME}:latest
            '''
        }
    }

    stage('Verify Deployment') {
        steps {
            sh 'docker ps'
        }
    }
}
```

}

