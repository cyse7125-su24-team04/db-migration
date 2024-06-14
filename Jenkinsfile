pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Validate Commit Messages') {
            steps {
                script {
                    def latestCommitMessage = sh(script: 'git log -1 --pretty=%B', returnStdout: true).trim()

                    if (!(latestCommitMessage =~ /^(fix|feat|chore|docs|style|refactor|test|perf|build|ci|revert|version|merge|hotfix|wip)\:.*/)) {
                        error "The commit message does not follow the Conventional Commit format:\n${latestCommitMessage}"
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
        success {
            echo 'Commit message follows Conventional Commit format'
        }
        failure {
            error 'Commit message does not follow Conventional Commit format'
        }
    }
}
