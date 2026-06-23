pipeline{
    agent any
    environment {
        DOCKER_IMAGE = "naliniselv/jenkins-docker"
        IMAGE_TAG = ${BUILD_NUMBER}

    }
    stages{
        stage('checkout the code'){
            steps{
                git branch: 'main', url: 'https://github.com/Nalini-0212/Trend.git'
        }
    }
        stage('Build Docker Image'){
            steps{
                echo "Building Docker Image"
                sh "docker build -t $DOCKER_IMAGE:$IMAGE_TAG . "
            }
        }
        stage('Push Docker Image'){
            steps{
                echo "Pushing Docker Image"
                withCredentials([usernamePassword(credentialsID: 'dockerhubcredential', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                    sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                    sh "docker push $DOCKER_IMAGE:$IMAGE_TAG"
                }
            }
        }
        
        
        
        }
