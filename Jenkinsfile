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
        
            
                echo 'Publishing....'
                docker.withRegistry('https://nexus.eig-dev.queencitygrid.net:31313', 'jenkins-nexus-qcg') {

                  image = dockerfile {
                    filename 'Dockerfile.prod'
                    dir '.'
                    label 'prod-2'
                  }

                  /* Push the container to the custom Registry */
                  image.push()
                }
            
        }
    }
}