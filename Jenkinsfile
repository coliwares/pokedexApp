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
                sh 'npm cache clean --force'
                sh 'rm -rf node_modules package-lock.json'
                sh 'npm install --legacy-peer-deps --loglevel verbose'            }
        }
        stage('Unit test') {
            steps {
                echo 'Running unit test'
                sh 'ng test --code-coverage --watch=false'
            }
        }
    }
}
