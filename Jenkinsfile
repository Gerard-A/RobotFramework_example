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
                echo 'Prepare virtualenv and run RobotFramework Tests'
                bat """
                   pip list
                   python -m venv venv
                   call venv\\Scripts\\activate.bat
                   pip list
                   pip install -r requirements.txt
                   pip list
                   runTest.bat
                """
                echo 'Finished RobotFramework Tests'
            }
            post {
        	    always {
		            script {
		                step(
			                [ $class              : 'RobotPublisher',
			                  outputPath          : 'test_results',
			                  outputFileName      : '**/output.xml',
			                  reportFileName      : '**/report.html',
			                  logFileName         : '**/log.html',
			                  disableArchiveOutput: false,
			                  passThreshold       : 0,
			                  unstableThreshold   : 0,
			                ]
		          	    )
		            }
	  		    }
	        }
	    }
    }
}
