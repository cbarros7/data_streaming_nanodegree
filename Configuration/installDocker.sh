sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common # packages which let apt use packages over HTTPS
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # add the GPG key for the official Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" # add Docker repository to APT sources
sudo apt install -y docker-ce # install docker

