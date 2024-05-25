pipeline {
    agent {
        docker {
            image 'node:18-alpine'
            args '-p 4200:4200'
        }
    }
    stages {
        stage('Install') {
            steps {
                echo 'Installing dependencies'
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