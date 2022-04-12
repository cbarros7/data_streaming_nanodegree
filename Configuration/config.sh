sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common # packages which let apt use packages over HTTPS
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # add the GPG key for the official Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" # add Docker repository to APT sources
sudo apt install -y docker-ce # install docker
sudo usermod -aG docker ${USER} # Execute docker coomand without Sudo
su - ${USER}

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose #Install docker Compose
chmod +x ~/.docker/cli-plugins/docker-compose # permissions so that the docker compose command

#git clone https://github.com/linuxacademy/content-kafka-deep-dive.git
cd InstallKafka/
docker compose up -d --build

cd home

#Install Java
sudo apt install -y defaul-jdk
sudo apt install -y defaul-jre

# Install Kafka
wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz
tar -xvf kafka_2.13-3.1.0.tgz

# Add kafka to PATH
export PATH=$PATH:/home/$USER/Configuration/kafka_2.13-3.1.0/bin
source ~/.bashrc