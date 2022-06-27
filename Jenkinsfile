pipeline {

  agent any

  stages {

      stage('checkout') {
            steps {
                checkout scm
            }
        }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("6752/repo-for-devops:${env.BUILD_ID}")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "demo-app.yml", kubeconfigId: "jenkins-token")
        }
      }
    }
  }
}
