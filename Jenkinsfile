pipeline {
    agent {
        docker {
            image 'maven:3.6.3-openjdk-8' // Use Maven image compatible with Java 8
        }
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ngdeveloper-projects/spring-boot-hello-world.git'
            }
        }
        stage('Build') {
            steps {
               
                sh 'mvn clean package' 
            }
        }
        stage('Initialize'){
            def dockerHome = tool 'myDocker'
            env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
        stage('Docker Build and Deploy') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t myapp:latest .'

                    // Stop and remove the existing container
                    sh '''
                    docker exec -u 0 -ti myapp sh
                    docker stop myapp || true
                    docker rm myapp || true
                    '''

                    // Run the new container
                    sh 'docker run -d --name myapp --network jenkins-network -p 8080:8080 myapp:latest'
                }
            }
        }
    }
}
