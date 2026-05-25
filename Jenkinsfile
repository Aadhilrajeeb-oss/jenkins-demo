pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                echo 'Cloning Repository...'
            }
        }

        stage('Build') {
            steps {
                sh 'python3 app.py'
            }
        }

        stage('Test') {
            steps {
                sh 'bash test.sh'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deployment Successful!'
            }
        }
    }
}
