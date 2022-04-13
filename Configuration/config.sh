sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common # packages which let apt use packages over HTTPS
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # add the GPG key for the official Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" # add Docker repository to APT sources
sudo apt install -y docker-ce # install docker

#sudo usermod -aG docker ${USER} # Execute docker coomand without Sudo
#su - ${USER}

cd home
mkdir -p ~/.docker/cli-plugins/
sudo curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose #Install docker Compose
sudo chmod +x ~/.docker/cli-plugins/docker-compose # permissions so that the docker compose command

echo "Ya se ha instalado docker compose"

#git clone https://github.com/linuxacademy/content-kafka-deep-dive.git

cd  /home/$USER/data_streaming_nanodegree/Configuration/InstallKafka/
docker compose up -d --build

echo "Ya se ha instalado docker"
cd # Go to home

#Install Java
sudo apt-get install openjdk-8-jdk
sudo apt-get install openjdk-8-jre
sudo apt-get install openjdk-8-jdk
#sudo apt install -y defaul-jre
#sudo apt install -y defaul-jdk


# Install Kafka
wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz
tar -xvf kafka_2.13-3.1.0.tgz

# Add kafka to PATH
#export PATH=$PATH:/home/$USER/data_streaming_nanodegree/Configuration/kafka_2.13-3.1.0/bin
#export PATH=$PATH:/home/$USER/kafka_2.13-3.1.0/bin
#source ~/.bashrc

# Install postgresql
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install -y postgresql-10

#Install Confluent Platform Packages
wget -qO - https://packages.confluent.io/deb/7.1/archive.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/7.1 stable main"
sudo add-apt-repository "deb https://packages.confluent.io/clients/deb $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install confluent-platform

sudo chmod u+x /home/$USER/data_streaming_nanodegree/startup.sh

cd /home/$USER/data_streaming_nanodegree/

sudo sh /home/$USER/data_streaming_nanodegree/startup.sh 

echo "Fin script"

