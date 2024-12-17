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
                // Run Maven build
                sh 'mvn clean install'
            }
        }

        stage('Maven package') {
            steps {
                sh 'mvn clean package -DskipInstall'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image if needed
                    def img = docker.build("${IMAGE}", ".")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    def container = docker.run('-d -p 8081:8080 --name my-container $IMAGE')
                    // Other logic to interact with the container
                }
            }
        }
    }
}
