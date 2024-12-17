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
                sh 'ls -l target/'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def workspace = pwd()
                    img = docker.build("${IMAGE}", "${workspace}")
                    docker.run("--rm", "${IMAGE}:latest", "ls", "-l", "/app")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    def container = img.run("-p 8081:8080")
                    echo "Docker container is running: ${container.id}"
                }
            }
        }
    }
}