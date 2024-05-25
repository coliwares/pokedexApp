pipeline {
    agent {
        docker {
            image 'node:20-alpine'
            args '-p 4200:4200 -u root:root'
        }
    }
    stages {
        stage('Install dependencies') {
            steps {
                echo 'Installing dependencies'
                sh 'npm cache clean --force'
                sh 'rm -rf node_modules package-lock.json'
                sh 'npm install -g @angular/cli'
                sh 'npm install --legacy-peer-deps'
                sh 'ng test --code-coverage --watch=false '
            }
        }
    }
}
