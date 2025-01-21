pipeline {
    agent any

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

        stage('Deploy') {
            steps {
                sh '''
                # Stop the existing application
                PID=$(pgrep -f 'myapp.jar')
                if [ ! -z "$PID" ]; then
                    echo "Stopping existing application..."
                    kill -9 $PID
                fi

                # Start the new application
                echo "Starting new application..."
                nohup java -jar target/myapp.jar &
                '''
            }
        }
    }
}
