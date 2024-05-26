pipeline {
    agent any

    environment {
        IMAGE_NAME = "pokedex-front-0:dev"  
        CONTAINER_NAME = "pokedex-front-dev-0"
        OUT_CONTAINER_PORT="61000"
        IN_CONTAINER_PORT="80"      
    }

    stages {
        stage('Checkout'){
            steps{
                checkout scm
            }            
        }   
        stage('Clean images not used'){
            steps{
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
        stage('Run Container'){
            steps {
                sh "docker run -t -d -i -p ${OUT_CONTAINER_PORT}:${IN_CONTAINER_PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME} &"
            }
        }
    }       
}