@Library('Shared')_

pipeline{
    agent any
    
    tools{
        nodejs 'nodejs24'
    }

    environment {
        SONAR_HOME = tool 'Sonar'
    }

    stages{
        stage("Empty Workspace"){
            steps{
                script{
                    cleanWs()
                }
            }
        }
        stage("Git Checkout"){
            steps{
                script{
                    clone("https://github.com/dakshsawhneyy/3-Tier-DevSecOps.git","dev")
                }
            }
        }
        stage("Check Frontend Code"){
            steps{
                // go inside client dir and check all js files
                dir('client') {
                    sh 'find . -name "*.js" -exec node --check {} +'
                }
            }
        }
        stage("Check Backend Code"){
            steps{
                // go inside api dir and check all js files
                dir('api') {
                    sh 'find . -name "*.js" -exec node --check {} +'
                }
            }
        }
        stage("Git Leaks Detection"){
            steps{
                sh 'gitleaks detect --source ./client --exit-code 1'
                sh 'gitleaks detect --source ./api --exit-code 1'
            }
        }
        stage("Sonar: Code Analysis"){
            steps{
                script{
                    sonarqube_analysis("Sonar","devsecops","devsecops")
                }
            }
        }
        stage("Sonar: Quality Gate Analysis"){
            steps{
                script{
                    sonarqube_code_quality()
                }
            }
        }
        stage("Trivy Scan"){
            steps{
                sh 'trivy fs --format table -o fs-resport.html .'
            }
        }
        
    }
}
