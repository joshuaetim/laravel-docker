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
                sh 'echo DB_HOST=${DB_HOST} >> .env'
                sh 'echo DB_USERNAME=${DB_USERNAME} >> .env'
                sh 'echo DB_DATABASE=${DB_DATABASE} >> .env'
                sh 'echo DB_PASSWORD=${DB_PASSWORD} >> .env'
                sh 'php artisan key:generate'
                sh 'cp .env .env.testing'
                sh 'php artisan migrate'
            }
        }
        stage("Unit test") {
            steps {
                sh 'php artisan test'
            }
        }
        stage("Static code analysis larastan") {
            steps {
                sh "vendor/bin/phpstan analyse --memory-limit=2G"
            }
        }
        stage("Code coverage") {
            steps {
                sh "vendor/bin/phpunit --coverage-html 'reports/coverage'"
            }
        }
  }
}