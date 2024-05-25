pipeline {
    agent {
        docker {
            image 'node:20Alpine'
            args '-p 4200:4200'
        }
    }
    stages {
        stage('Install dependencies') {
            steps {
                echo 'Installing dependencies'
                sh 'npm i --legacy-peer-deps'
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