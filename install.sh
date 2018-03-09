#!bin/bash
sudo apt-get purge nginx
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apache2 git-core nano software-properties-common curl
sudo apt-get install -y dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update
sudo apt-get install -y libapache2-mod-passenger
sudo a2enmod passenger
sudo apache2ctl restart
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y python-certbot-apache
sudo apache2ctl restart
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev imagemagick gsfonts nodejs redis-server 
sudo apt-get update
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
rbenv install 2.2.2
rbenv global 2.2.2
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
rbenv rehash
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
sudo apt-get update
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc |sudo apt-key add -
sudo apt-get update
sudo apt-get install -y rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server restart
wget http://localhost:15672/cli/rabbitmqadmin
chmod +x rabbitmqadmin
sudo mv rabbitmqadmin /usr/local/sbin
echo "export RAILS_ENV=production" >> ~/.bashrc
source ~/.bashrc
mkdir -p ~/peatio
git clone -b stable https://github.com/InfraexDev/peatio.git ~/peatio/current/
cd ~/peatio/current/
bundle install --without development test --path vendor/bundle
bin/init_config
sudo nano ~/peatio/current/config/application.yml
sudo nano ~/peatio/current/config/database.yml
git clone https://gist.github.com/80250c2138cb1928767f77d5a0a2cf4e.git zz
sudo cp ~/peatio/current/zz/currencies.yml ~/peatio/current/config/currencies.yml
sudo rm -rf ~/peatio/current/zz
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start
bundle exec rake db:setup
bundle exec rake assets:precompile
bundle exec rake daemons:start
cd
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y bitcoind
git clone https://gist.github.com/60c7f098944c1d08022804b51ff72e03.git bb
mkdir -p ~/.bitcoin
sudo cp ~/bb/bitcoin.conf ~/.bitcoin/bitcoin.conf
sudo rm -rf bb/
git clone https://gist.github.com/0b58342ed0ca5e0bf0631044e3d46f55.git conf1
sudo cp ~/conf1/apache.conf /etc/apache2/sites-available/peatio.conf
sudo rm -rf conf1
sudo nano /etc/apache2/sites-available/peatio.conf
sudo a2dissite 000-default
sudo a2ensite peatio
sudo apache2ctl restart
