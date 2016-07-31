# Install MongoDB

echo "updating packages"

yum -q -y update

echo "installing mongodb"

cat << EOF2 >> /etc/yum.repos.d/mongo-org-3.2.repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
EOF2

yum -y -q install mongodb-org mongodb-org-server
systemctl start mongod

# Install Java 8
echo "installing Java"

wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.rpm"
rpm -i jdk-8u101-linux-x64.rpm 
rm jdk-8u101-linux-x64.rpm 

# Install git
echo "installing git"

yum install -y -q git

# Install Maven
echo "installing maven"

wget -q http://apache.claz.org/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

echo "installing maven"
tar -xf apache-maven-3.3.9-bin.tar.gz -C /opt
rm apache-maven-3.3.9-bin.tar.gz

echo "export MAVEN_HOME=/opt/apache-maven-3.3.9" >> /home/vagrant/.bashrc
echo "export PATH=\$MAVEN_HOME/bin:\$PATH" >> /home/vagrant/.bashrc

# install node
echo "installing node"

yum install -y -q epel-release
yum install -y -q nodejs npm

# Install Ansible
echo "installing ansible"

yum install -y -q ansible

echo "installing fabric"

yum install -y -q fabric

echo "installing consul"

yum install -y -q unzip

wget -q https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip
unzip consul*
mv consul /usr/bin
rm consul*

# remove old message of the day
echo "cleanup"

rm /etc/motd

yum clean all -q
