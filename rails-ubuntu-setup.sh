#its assumed you already created a deploy user or someone that has sudo rights

echo "\nupdating sytem...\n\n"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install build-essential libssl-dev libreadline-dev -y
sudo apt-get install wget

echo "\ninstalling ruby...\n\n"
wget http://smartic.us/assets/2008/10/5/ruby-1.8.6-p287.tar.gz
tar zxvf ruby-1.8.6-p287.tar.gz 
rm ruby-1.8.6-p287.tar.gz 
cd ruby-1.8.6-p287
./configure --prefix=/usr/local
make && sudo make install
cd ..

echo "\ninstalling rubygems...\n\n"
wget http://rubyforge.org/frs/download.php/43985/rubygems-1.3.0.tgz
tar zxvf rubygems-1.3.0.tgz
rm rubygems-1.3.0.tgz
cd rubygems-1.3.0
sudo ruby setup.rb
cd ..


echo "\ninstalling mysql...\n\n"
sudo apt-get install mysql-server libmysqlclient15-dev -y
sudo gem install mysql

echo "\ninstalling nginx...\n\n"
# (http://articles.slicehost.com/2007/12/7/ubuntu-gutsy-installing-nginx-via-aptitude)
sudo aptitude install nginx -y

echo "\ninstalling mongrel...\n\n"
sudo gem install mongrel mongrel_cluster
echo "\ncreate mongrel vhosts and such ala: http://articles.slicehost.com/2008/1/16/ubuntu-gutsy-nginx-vhosts-rails-and-mongrels\n"

echo "\ninstalling rails...\n\n"
sudo gem install rails

