stage("OWASP Dependency Check"){
            steps{
                dependencyCheck additionalArguments: '--scan ./ ', odcInstallation: 'DP-Check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml' 
            }
        }



# sb kampı
stage('OWASP Dependency-Check Vulnerabilities') {
      steps {
        dependencyCheck additionalArguments: ''' 
                    -o './'
                    -s './'
                    -f 'ALL' 
                    --prettyPrint''', odcInstallation: 'OWASP Dependency-Check Vulnerabilities'
        
        dependencyCheckPublisher pattern: 'dependency-check-report.xml'
      }
    }        


# chatgpt

pipeline {
    agent any

    stages {
        stage('OWASP Dependency-Check Vulnerabilities') {
            steps {
                dependencyCheck additionalArguments: ''' 
                    -o './'
                    -s './'
                    -f 'ALL' 
                    --prettyPrint''', odcInstallation: 'OWASP Dependency-Check Vulnerabilities'

                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
            }
        }
    }
}



pipeline {
    agent any
     stages {
        stage('Git Checkout') {
            steps {
                git changelog: false, poll: false, url: 'https://github.com/shubnimkar/CI_CD_Devsecops.git'
            }
        }


        stage('OWASP Dependency-Check') {
            steps {
                // Listeleme, debug için
                sh 'ls -la'

                dependencyCheck additionalArguments: '''
                    --project JuiceShop
                    --scan ./
                    --format ALL
                    --prettyPrint
                    --out dependency-check-report''', odcInstallation: 'OWASP Dependency-Check Vulnerabilities'

                // Dosyaların oluştuğunu kontrol için:
                sh 'ls -la dependency-check-report'

                dependencyCheckPublisher pattern: 'dependency-check-report/dependency-check-report.xml'
            }
        }
    }
}



stage("OWASP Dependency Check"){
            steps{
                dependencyCheck additionalArguments: '--scan ./ ', odcInstallation: 'DP-Check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml' 
            }
        }