pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-2'
        APPLICATION_NAME = 'microservice-codedeploy'
        DEPLOYMENT_GROUP = 'microservice-deployment-group'
        S3_BUCKET = 'aadhil-codedeploy-artifacts'
    }

    stages {

        stage('Clone') {
            steps {
                echo 'Cloning source code...'
            }
        }

        stage('Build') {
            steps {
                echo 'Building application...'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
            }
        }

        stage('Create Deployment Bundle') {
            steps {
                sh '''
                zip -r deployment.zip .
                '''
            }
        }

        stage('Upload to S3') {
            steps {
                sh '''
                aws s3 cp deployment.zip s3://$S3_BUCKET/deployment.zip
                '''
            }
        }

        stage('Deploy to EC2') {
            steps {
                sh '''
                aws deploy create-deployment \
                  --application-name $APPLICATION_NAME \
                  --deployment-group-name $DEPLOYMENT_GROUP \
                  --s3-location bucket=$S3_BUCKET,bundleType=zip,key=deployment.zip
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!'
        }

        failure {
            echo 'Deployment failed!'
        }
    }
}
