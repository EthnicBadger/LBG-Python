pipeline {
    agent any
    stages {
        stage('Greeting') {
            steps {
                sh ''' 
                echo "Hello, Jenkins is working"
                '''
            }
        }
      stage('Load script') {
            steps {
                sh ''' 
                echo "Hello, Starting script"
                chmod +x build.sh
                ./build.sh 

                '''
            }
        }
    }
}