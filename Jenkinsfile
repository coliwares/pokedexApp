pipeline {
    agent {
        docker {
            image 'node:20-alpine'
            args '-p 4200:4200'
        }
    }
    stages {
        stage('Install dependencies') {
            steps {
                echo 'Installing dependencies'
                sh 'sudo mkdir -p /.npm/_logs'
                sh 'npm install'
            }
        }
        stage('Unit test') {
            steps {
                echo 'Running unit test'
                sh 'ng test --code-coverage --watch=false'
            }
        }
    }
}