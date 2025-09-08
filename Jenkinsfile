pipeline
{
  agent any

  tools
  {
  maven "maven-3.9.11"
  }

  stages
  {

     stage('checkout')
     {

       steps
       {
        git branch: 'dev', credentialsId: 'aa528cef-cbd8-4ef2-8c34-cb5cff2be464', url: 'https://github.com/kkdevopsb4/maven-web-app-project-kk-funda.git'
        }

     }

     stage('COMPILE')
     {
         steps
         {

         sh "mvn clean compile"

         }
     }

    stage('BUILD')
     {
         steps
         {

         sh "mvn clean package"

         }
     }

    stage('SQ REPORT')
     {
         steps
         {

         sh "mvn clean sonar:sonar"

         }
     }
    stage('Deploy to Nexus')
     {
         steps
         {

         sh "mvn clean deploy"

         }
     }

        stage('Deploy App')
     {
        steps
        {
         echo "Deploying WAR file using curl..."

        sh """
            curl -u kkfunda:password \
            --upload-file /var/lib/jenkins/workspace/jio-Scripted-dev-PL/target/maven-web-application.war \
            "http://98.83.143.151:8080/manager/text/deploy?path=/maven-web-application&update=true"
        """
        }
     }



  } //stages ending
  
} //pipeline ending
