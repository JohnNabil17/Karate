pipeline{
    agent any
    
    stages{
        stage('CleanUp Stage'){
            steps{
                //define the single or multiple steps
                bat 'echo CleanUp Stage'
                cleanWs notFailBuild: true
            }
        }
        stage('Git Checkout'){
            steps{
                //define the single or multiple steps
                bat 'echo Git Checkout'
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rahulrathore44/KarateFrameworkTutorial.git']])
            }
        }
        stage('Restore Package Stage'){
            steps{
                //define the single or multiple steps
                bat 'echo Restore Package'
            }
        }
        stage('Build Stage'){
            steps{
                //define the single or multiple steps
                bat 'echo Build'
                bat 'mvn clean compile'
            }
        }
        stage('Test Execution Stage'){
            steps{
                //define the single or multiple steps
                bat 'echo Test Execution Started'
                bat 'mvn test'
            }
        }
    }
    post {
  always {
    junit 'target/surefire-reports/*.xml'
    cucumber buildStatus: 'null', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/surefire-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
  }
}

}