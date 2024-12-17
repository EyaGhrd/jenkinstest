pipeline {
    agent any

    environment {
        IMAGE = 'my-image'
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/EyaGhrd/jenkinstest.git', credentialsId: 'github-token'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    img = docker.build("${IMAGE}", '.')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    def container = img.run("-p 8082:8080")
                    echo "Docker container is running: ${container.id}"
                }
            }
        }
    }
}