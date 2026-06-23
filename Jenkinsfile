pipeline{
    agent any
    environment {
        DOCKER_IMAGE = "naliniselv/jenkins-docker"
        IMAGE_TAG = "${BUILD_NUMBER}"
        AWS_REGION = "us-east-1"
        CLUSTER_NAME = "trend-cluster"

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
                sh "docker build -t $DOCKER_IMAGE:$IMAGE_TAG ."
            }
        }
        stage('Push Docker Image'){
            steps{
                echo "Pushing Docker Image"
                withCredentials([usernamePassword(credentialsId: 'dockerhubcredential', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                    sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                    sh "docker push $DOCKER_IMAGE:$IMAGE_TAG"
                }
            }
        }
        stage ('Deploy Docker Image on Kubernetes cluster'){
            steps{
                echo "Deploying Docker Image on Kubernetes cluster"
                sh '''
                aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME
                kubectl apply -f secret.yaml
                kubectl apply -f service.yaml
                kubectl apply -f Deployment.yaml
                '''
            }
        }

        stage('Verify Application Deployment'){
            steps{
                echo "Verifying Application Deployment"
                sh '''
                kubectl get pods
                kubectl get services
                kubectl get deployments
                '''
            }
        }
    }

}
