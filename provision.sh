# Install MongoDB

cat << EOF2 >> /etc/yum.repos.d/mongo-org-2.6.repo
[mongodb-org-2.6]
name=MongoDB 2.6 Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOF2

yum install -y mongodb-org
/etc/init.d/mongod start

# Install Java 8

wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm"
rpm -i jdk-8u60-linux-x64.rpm 
rm jdk-8u60-linux-x64.rpm 

# Install git

yum install -y git

# Install Ansible

yum install -y ansible

# Install Maven

wget -q http://www.motorlogy.com/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz -O apache-maven-3.3.3-bin.tar.gz
echo "installing maven"
tar -xf apache-maven-3.3.3-bin.tar.gz -C /opt
rm apache-maven-3.3.3-bin.tar.gz
echo "export MAVEN_HOME=/opt/apache-maven-3.3.3" >> /home/vagrant/.bashrc
echo "export PATH=\$MAVEN_HOME/bin:\$PATH" >> /home/vagrant/.bashrc

# install node

yum install -y epel-release
yum install -y nodejs npm

# remove old message of the day

rm /etc/motd
