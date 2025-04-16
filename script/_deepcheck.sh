 
cd /var/jenkins_home/.local/bin/

mkdir depCheck

cd depCheck

#exit diyip root user a gecilir root useri iseniz cikmaniza gerek yok
exit
apt-get install wget

su jenkins

cd /var/jenkins_home/.local/bin/depCheck

wget https://github.com/jeremylong/DependencyCheck/releases/download/v12.0.2/dependency-check-12.0.2-release.zip

unzip dependency-check-12.0.2-release.zip

/var/jenkins_home/.local/bin/depCheck/dependency-check/bin/dependency-check.sh -v 

#cikti geldiyse basariyla kurulmustur
 
 



#Unpacking https://github.com/dependency-check/DependencyCheck/releases/download/v12.1.1/dependency-check-12.1.1-release.zip to 
# /var/jenkins_home/tools/org.jenkinsci.plugins.DependencyCheck.tools.DependencyCheckInstallation/OWASP_Dependency-Check_Vulnerabilities on Jenkins