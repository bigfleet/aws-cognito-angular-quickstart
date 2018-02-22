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
                docker.withRegistry('https://nexus.eig-dev.queencitygrid.net:31313', 'jenkins-nexus-qcg') {
                  dockerfile = 'Dockerfile.prod'
                  customImage = docker.build("nexus.eig-dev.queencitygrid.net:31313/eig-dev-signup:${env.BUILD_ID}", "-f ${dockerfile} .")

                  /* Push the container to the custom Registry */
                  customImage.push()
                }
              }
            }
        }
    }
}