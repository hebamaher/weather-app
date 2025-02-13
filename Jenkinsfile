pipeline {
    agent any
    environment {
        // Set the credentials environment variable
        GITHUB_TOKEN = credentials('github')  // 'github-pat' is the ID of the stored Jenkins credential
        GITHUB_USER = 'hebamaher' // Set your GitHub username here
        DOCKER_IMAGE = "hebamaher/weather-app"
        DOCKER_CREDENTIALS = "docker-hub"
    }
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Construct the repository URL with the username and token
                    def repoUrl = "https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/hebamaher/weather-app.git"
                    def branch = 'main'

                    // Clone the repository
                    if (fileExists("weather-app/.git")) {
                        // If repo exists, pull latest changes
                        dir("weather-app") {
                            sh "git reset --hard"
                            sh "git pull origin ${branch}"
                        }
                    } else {
                        // Clone fresh copy if repo doesn't exist
                        sh "git clone -b ${branch} ${repoUrl}"
                    }
                    
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t hebamaher/weather-app:latest weather-app/"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                        sh "docker push ${DOCKER_IMAGE}:latest"
                    }
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                script {
                    withEnv(["ANSIBLE_HOST_KEY_CHECKING=False"]) {
                        sh"ls -la"
                        sh "chmod 600 weather-app/private_key1"
                        sh "chmod 600 weather-app/private_key2"
                        sh "export ANSIBLE_HOST_KEY_CHECKING=False"
                        sh "ansible-playbook -i weather-app/inventory weather-app/playbook.yml"
                    }
                }
            }
        }
    }
}
