pipeline {
      agent any
      stages {
            stage('Initialization') {
                  steps {
                        echo 'Hi, this is Anoop from CTRLS'
                        echo 'We are Starting the Testing'
                  }
            }
            stage('Deploying war file') {
                  steps {
                        sh 'mvn -f pom.xml clean package'
                  }
				  post {
                success {
                    echo "Now Archiving the Artifacts...."
                    archiveArtifacts artifacts: '**/*.war'
                }
             }
            }
            stage('Create Tomcat Docker Image') {
                  steps {
			 sh "pwd" 
			sh "ls -a"
                        sh "docker build . -t tomcatsamplewebapp:${env.BUILD_ID}"
                  }
            }
            stage('Deploy Production') {
                  steps {
                        echo "Deployed sucess"
                  }
            }
      }
}
