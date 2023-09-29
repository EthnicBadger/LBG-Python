pipeline {
    environment {
        PORT = 9000
    }
    agent any
    stages {
        stage('Greeting') {
            steps {
                sh ''' 
                echo "Hello, Jenkins is working"
                '''
            }
        }
      stage('build image') {
            steps {
                sh ''' 
                echo "Starting to build images"
                docker build -t gcr.io/lbg-mea-14/ak-lbg-python-api:v${BUILD_NUMBER} .
                docker build -t gcr.io/lbg-mea-14/ak-lbg-python-api .
                '''
            }
        }
      stage('run unit tests') {
            steps {
                sh ''' 
                pip3 install -r requirements.txt
                echo "Invoking deploy.sh to stop, remove and run new"
                chmod +x .deploy.sh
                .deploy.sh
                '''
            }
        }
    }
}