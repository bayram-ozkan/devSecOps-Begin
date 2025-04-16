
#dizin
/var/jenkins_home/.local/bin/

# klasör oluştur
mkdir trufflehog

# repoyu kopyala bunu jenkins kullanıcı olarak kurman önemli
git clone https://github.com/trufflesecurity/trufflehog.git


# go kurman gerekebilir. root kullanıcısına geç
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go


# dizine geçiş yap ve go yla 
cd trufflehog; go install trufflehog kur



cd /var/jenkins_home/.local/bin/trufflehog
go mod tidy
go build -o trufflehog .

# trufflehog un pipeline a eklenmesi
/var/jenkins_home/.local/bin/trufflehog/trufflehog



    