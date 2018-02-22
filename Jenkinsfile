pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'npm install'
                sh 'npm build'
                sh 'docker build -t bigfleet/eig-dev-signup:prod-2 -f Dockerfile.prod .'
            }
        }
        stage('Test') {
            steps {
                echo 'No testing for this app.'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}