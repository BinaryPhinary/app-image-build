pipeline {
    agent any
     options {
        skipStagesAfterUnstable()
    }
stages { 
    stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                }
            }
    }   
    stage('Build docker image') {
        steps {
            script{ 
                mbeye = docker.build("mb-eye")
            }
        }
    }
     stage('Deploy') {
            steps {
                script{
                        docker.withRegistry('https://633706706076.dkr.ecr.us-east-1.amazonaws.com/mb-eye', 'ecr:us-east-1:aws-main-admin-user') {
                    mbeye.push("${env.BUILD_NUMBER}")
                    mbeye.push("latest")
                }
            }
        }
    }
}    
}

