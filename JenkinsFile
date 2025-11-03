pipeline {
    agent any

    environment {
        IMAGE_NAME = "node-docker-jenkins"
        CONTAINER_NAME = "nodeJD"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning GitHub repository using Personal Access Token...'
                git credentialsId: 'JenkinsToken', branch: 'main', url: 'https://github.com/ShubhamShrestha60/node-docker-jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t ${IMAGE_NAME}:v1 .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running container using Docker Compose...'
                sh '''
                    docker compose down || true
                    docker compose up -d 
                '''
            }
        }

        stage('Verify Running Containers') {
            steps {
                sh 'docker ps'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! Your AMNIL Node app is running in Docker.'
        }
        failure {
            echo ' Deployment failed. Please check the logs above.'
        }
    }
}
