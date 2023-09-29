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
                echo "Hello, Starting the build process"
                chmod -x .build.sh
                run build.sh
                '''
            }
        }
    }
}