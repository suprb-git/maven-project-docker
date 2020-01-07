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
			stage ('pushing the image to private repo') {
				steps {
						sh "docker tag tomcatsamplewebapp:${env.BUILD_ID} cloudlinuxdoc/new-learning-repo:${env.BUILD_ID}"
						sh "docker login -u cloudlinuxdoc -p linux@C10UD4c docker.io"
						sh "docker push cloudlinuxdoc/new-learning-repo:${env.BUILD_ID}"
						echo 'Successfully pushed to hub'
						}
			}
           
      }
}
