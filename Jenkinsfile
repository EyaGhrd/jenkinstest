pipeline {
    agent any

    environment {
        MAVEN_HOME = '/usr/share/maven'  // Update path to Maven if necessary
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/EyaGhrd/jenkinstest'  // Replace with your repo URL
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Archive Build') {
            steps {
                archiveArtifacts '**/target/*.jar'
            }
        }

        stage('Deploy') {
            steps {
                // Add deploy commands here (e.g., to a server or Docker)
            }
        }
    }

    post {
        always {
            echo 'This will run after all stages, regardless of success or failure.'
        }
        success {
            echo 'Build was successful!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
