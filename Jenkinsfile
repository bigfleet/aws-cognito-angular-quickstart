pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                echo 'No testing for this app.'
            }
        }
        stage('Publish') {
            steps {
              script {
                echo 'Publishing....'
                  docker.withRegistry('https://docker.artifactory.queencitygrid.net', 'jenkins-artifactory-credentials') {
                    dockerfile = 'Dockerfile.prod'
                    customImage = docker.build("docker.artifactory.queencitygrid.net/eig-dev-signup:${env.BUILD_ID}", "-f ${dockerfile} .")

                    /* Push the container to the custom Registry */
                    customImage.push()
                  }
            }
        }
    }
}