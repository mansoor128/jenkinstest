pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
              sh 'docker build -t mansoorclc/test .'
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
