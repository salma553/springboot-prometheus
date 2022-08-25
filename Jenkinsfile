pipeline{
    
    agent any
    
    tools{
        maven "Maven3"
    }
    
    stages{
        
        stage("Git Checkout"){
            
            steps{
                git 'https://github.com/bashacse/springboot-prometheus.git'
            }
        }
        
        stage("Maven Build"){
            steps{
                sh 'rm -rf target'
                sh 'mvn -Dmaven.skip.test package -f pom.xml'
                sh 'mv target/*.war target/spring.war'
                sh 'ls target'
            }
        }
        
        stage("Dev Deploy"){
            steps{
                sshagent(credentials:['8edcb285-213d-427a-9008-2b59d65e56bb']) {
                    // for multipleline lines of script we use tripple quotes
                    // StrictHostKeyChecking=no --> to suppress StrictHostKeyChecking
                    // for copying to remote machine we use scp command
                    // to execute commands in remote machine we use ssh username@ip command
                    sh """
                       ssh azureuser@20.213.70.79 sh /home/azureuser/app-service/bin/shutdown.sh
                       scp -o StrictHostKeyChecking=no  target/spring.war azureuser@20.213.70.79:/home/azureuser/app-service/webapps/ROOT.war
                       ssh azureuser@20.213.70.79 sh /home/azureuser/app-service/bin/startup.sh
                    """
                }
            }
        }
    }
}
