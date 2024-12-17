pipeline {
    agent any  // This tells Jenkins to run the pipeline on any available node

    environment {
        IMAGE = 'my-image'  // Define an environment variable if needed
    }

    stages {
        stage('Clone') {
            steps {
                // Clone your Git repository
                git 'https://github.com/EyaGhrd/jenkinstest.git'
            }
        }

        stage('Maven Build') {
            steps {
                // Run Maven build
                sh 'mvn clean install'
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

        stage('Run Docker') {
            steps {
                script {
                    // Run Docker container
                    img.run('-d -p 8080:8080')
                }
            }
        }
    }
}
