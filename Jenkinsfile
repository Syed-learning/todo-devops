pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git branch: 'master',
            url:  'https://github.com/Syed-learning/todo-devops.git',
            credentialsId: 'github-token'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t todo-app .'
      }
    }

    stage('Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
            echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
            docker tag todo-app $USERNAME/todo-app:latest
            docker push learningdocker826/todo-app:latest
          '''
        }
      }
    }

    stage('Deploy to EC2') {
      steps {
        sshagent(credentials: ['ec2-ssh-key']) {
          sh '''
            ssh -o StrictHostKeyChecking=no ubuntu@3.93.198.117 '
              docker pull learningdocker826/todo-app:latest &&
              docker stop todo || true &&
              docker rm todo || true &&
              docker run -d -p 5000:5000 --name todo learningdocker826/todo-app:latest
            '
          '''
        }
      }
    }
  }
}
