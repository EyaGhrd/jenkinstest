pipeline {
    agent any  // This tells Jenkins to run the pipeline on any available node

    environment {
        IMAGE = 'my-image'  // Define an environment variable if needed
    }

    stages {
        stage('Clone') {
            steps {
                // Clone your Git repository
                git branch: 'main', url: 'https://github.com/EyaGhrd/jenkinstest.git', credentialsId: 'github-token'
            }
        }

        stage('Maven Build') {
            steps {
                // Run the Maven build
                sh 'mvn clean install -DskipInstall
'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    img = docker.build("${IMAGE}:latest", '.')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    def container = img.run("-p 8081:8080")
                    echo "Docker container is running: ${container.id}"
                }
            }
        }
    }
}