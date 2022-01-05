pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Start building...'
                echo 'Build...'
                echo 'Finished building'
            }
        }
        stage('Test') {
            steps {
                echo 'Starting RobotFramework Tests'
                bat 'runTest.bat'
                echo 'Finished RobotFramework Tests'
            }
        }
    }
}
