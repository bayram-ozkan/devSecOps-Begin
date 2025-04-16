docker ps 
#container idsini al
docker exec  —user root -it containerid bash
#containerin icerisine girdigimiz user ve bashin degistiginden anlayabilirsiniz.
apt-get update
apt-get install python3
apt-get install pipx
python3 -m pipx install semgrep
su jenkins
pipx ensurepath
/var/jenkins_home/.local/bin/semgrep -v
#cikti gelydiyse semgrep basariyla kurulmustur 