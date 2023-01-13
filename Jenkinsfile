pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                  echo 'Deploying....'
            }
        }
        stage('Test') {
            steps {
               sh 'composer install'
            }
        }
        stage('Deploy') {
            steps {
                  echo 'Deploying....'

            }
        }
    }
}
