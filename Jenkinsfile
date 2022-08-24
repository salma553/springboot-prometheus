pipeline{
    
    agent any
    
    tools{
        maven "maven-3-5.4"
    }
    
    stages{
        
        stage("Git Checkout"){
            
            steps{
                git 'https://github.com/bashacse/springboot-prometheus.git'
            }
        }
        
        stage("Maven Build"){
            steps{
                sh 'mvn -Dmaven.skip.test package -f pom.xml'
            }
        }
    }
}
