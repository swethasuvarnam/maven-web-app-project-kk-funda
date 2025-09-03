
node {

   echo "git branch name: ${env.BRANCH_NAME}"
   echo "build number is: ${env.BUILD_NUMBER}"
   echo "node name is: ${env.NODE_NAME}"
    
    def mavenHome=tool name: "maven-3.9.11"

    try {

	stage('git checkout')
	{ git branch: 'dev', credentialsId: '5ea20986-163c-4386-8e41-58e1dc568ae1', url: 'https://github.com/swethasuvarnam/maven-web-app-project-kk-funda.git'}
      
	stage('compile')
	{
    sh  "${mavenHome}/bin/mvn compile"
	}
	stage('Build')
	{
    sh  "${mavenHome}/bin/mvn clean package"
	}
   stage('SQ Report')
	{
    sh  "${mavenHome}/bin/mvn sonar:sonar"
	}
	stage('Deploy into Nexus')
	{
    sh  "${mavenHome}/bin/mvn clean deploy"
	}
	stage('Deploy to Tomcat') {
        echo "Deploying WAR file using curl..."

        sh """
           curl -u swetha:swetha\
        --upload-file /var/lib/jenkins/workspace/MBPL-jio_prod/target/maven-web-application.war\
        "http://100.24.30.167:8080/manager/text/deploy?path=/maven-web-application&update=true"
        """
    }

  } catch (e) {
    // If there was an exception thrown, the build failed
    currentBuild.result = "FAILED"
    throw e
  } finally {
    // Success or failure, always send notifications
    notifyBuild(currentBuild.result)
  }
}

def notifyBuild(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESS'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESS') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary)
}
