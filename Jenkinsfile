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
                chmod +x .deploy.sh
                ./deploy.sh
                sleep 3
                python3 lbg.test.py

                '''
            }
        }
      stage('push image') {
            steps {
                sh ''' 
                docker push gcr.io/lbg-mea-14/ak-lbg-python-api:v${BUILD_NUMBER} 
                docker push gcr.io/lbg-mea-14/ak-lbg-python-api
                '''
            }
        }
      stage('clean up jenkins') {
            steps {
                sh ''' 
                docker stop python-app \
                && (docker rm python-app) \
                || (docker rm python-app && sleep 1 || sleep 1)
                docker rmi gcr.io/lbg-mea-14/ak-lbg-python-api
                docker rmi gcr.io/lbg-mea-14/ak-lbg-python-api:v${BUILD_NUMBER}
                '''
            }
        }
       stage('deploy') {
            steps {
                sh ''' 
                ssh 10.200.0.20 < deploy.sh
                '''
            }
        }
    }
}