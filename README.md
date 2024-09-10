# friendly-waffle
Just a boring list

https://docs.aws.amazon.com/AmazonS3/latest/userguide/security_iam_service-with-iam.html


# Update package lists
sudo yum update -y

# Git
sudo yum install git -y

# Memcached
sudo yum install memcached -y
sudo systemctl start memcached
sudo systemctl enable memcached

# Redis
sudo amazon-linux-extras install redis6 -y
sudo systemctl start redis
sudo systemctl enable redis

# PostgreSQL
sudo amazon-linux-extras install postgresql14 -y
sudo systemctl start postgresql
sudo systemctl enable postgresql

# MongoDB (NoSQL alternative to DynamoDB)
# Create a file named /etc/yum.repos.d/mongodb-org-6.0.repo with the following contents:
echo "[mongodb-org-6.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/6.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc" | sudo tee /etc/yum.repos.d/mongodb-org-6.0.repo

sudo yum install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

# Elasticsearch (Full-text search engine)
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
echo "[elasticsearch]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
autorefresh=1
type=rpm-md" | sudo tee /etc/yum.repos.d/elasticsearch.repo

sudo yum install --enablerepo=elasticsearch elasticsearch -y
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch

# RabbitMQ (Message broker)
sudo yum install rabbitmq-server -y
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server

# Apache Kafka (Distributed streaming platform)
# Note: Kafka requires Java, so we'll install it first
sudo amazon-linux-extras install java-openjdk11 -y

# Download and extract Kafka
wget https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz
tar -xzf kafka_2.13-3.4.0.tgz
sudo mv kafka_2.13-3.4.0 /opt/kafka

# Start Zookeeper (Kafka dependency)
sudo /opt/kafka/bin/zookeeper-server-start.sh -daemon /opt/kafka/config/zookeeper.properties

# Start Kafka
sudo /opt/kafka/bin/kafka-server-start.sh -daemon /opt/kafka/config/server.properties

# Nginx (Web server and reverse proxy)
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx
sudo systemctl enable nginx
