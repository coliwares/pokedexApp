pipeline {
    agent {
        docker {
            image 'node:17-alpine'
        }
    }

    environment {
        IMAGE_NAME = 'pokedex-front-0:dev'
        CONTAINER_NAME = 'pokedex-front-dev-0'
        OUT_CONTAINER_PORT = '61000'
        IN_CONTAINER_PORT = '80'
    }


    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('load npm dependencies') {
            echo 'Load npm dependencies'
            sh 'npm install'
        }
        stage('build') {
            echo 'building'
            sh 'npm run build'
        }
        stage('unit test') {
            sh 'ng test --progress false --watch false'
            echo 'generate test report **/dist/test-reports/*.xml'
            junit allowEmptyResults: false, testResults: '**/test-results.xml'
            echo 'end test & coverage'
        }

        stage('Clean images not used') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "docker images -a --no-trunc | grep 'none' | awk '{print \$3}' | xargs docker rmi"
                    sh "docker rmi -f ${IMAGE_NAME}"
                }
            }
        }
        stage('Build Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} -f Dockerfile ."
            }
        }
        stage('Stop Container') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "docker stop ${CONTAINER_NAME}"
                    sh "docker rm -f ${CONTAINER_NAME}"
                }
            }
        }
        stage('Run Container') {
            steps {
                sh "docker run -t -d -i -p ${OUT_CONTAINER_PORT}:${IN_CONTAINER_PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME} &"
            }
        }
    }
    post {
        failure {
            echo 'Failed'
            slackSend channel: 'despliegues', color: 'danger', iconEmoji: ':pokeball:', message: 'La ejecucion ha fallado', tokenCredentialId: 'slack'
        }
        fixed {
            echo 'Fixed'
            slackSend channel: 'despliegues', color: 'good', iconEmoji: ':pokeball:', message: 'La ejecucion ha sido corregida', tokenCredentialId: 'slack'
        }
    }
}
