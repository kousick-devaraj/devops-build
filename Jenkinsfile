pipeline {
    agent any
    environment {
        DOCKER_CREDS = credentials('docker-hub-creds')
        DOCKER_USER = "${DOCKER_CREDS_USR}"
        APP_NAME = "react-app"
    }
    stages {
        stage('Build Image') {
            steps {
                script {
                    def repo = env.BRANCH_NAME == 'master' ? 'prod' : 'dev'
                    def tag = "${DOCKER_USER}/${repo}:${env.BUILD_NUMBER}"
                    sh "chmod +x build.sh"
                    sh "./build.sh ${tag}"
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    def repo = env.BRANCH_NAME == 'master' ? 'prod' : 'dev'
                    def tag = "${DOCKER_USER}/${repo}:${env.BUILD_NUMBER}"
                    sh "echo \$DOCKER_CREDS_PSW | docker login -u \$DOCKER_USER --password-stdin"
                    sh "docker push ${tag}"
                    sh "docker logout"
                }
            }
        }
        stage('Deploy to Server') {
            steps {
                script {
                    def repo = env.BRANCH_NAME == 'master' ? 'prod' : 'dev'
                    def tag = "${DOCKER_USER}/${repo}:${env.BUILD_NUMBER}"
                    sh "chmod +x deploy.sh"
                    sh "./deploy.sh ${tag}"
                }
            }
        }
    }
}
