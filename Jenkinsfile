pipeline {
 agent any
 
 environment{
    DB_HOST = credentials("laravel-host")
    DB_DATABASE = credentials("laravel-database")
    DB_USERNAME = credentials("laravel-user")
    DB_PASSWORD = credentials("laravel-password")
 }

 stages {
        stage("Build") {
            steps {
                sh 'php --version'
                sh 'composer install'
                sh 'composer --version'
                sh 'cp .env.example .env'
                sh 'php artisan key:generate'
            }
        }
        stage("Unit test") {
            steps {
                sh 'php artisan test'
            }
        }
        stage("Code coverage") {
            steps {
                sh "vendor/bin/phpunit --coverage-html 'reports/coverage'"
            }
        }
  }
}