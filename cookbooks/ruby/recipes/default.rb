execute 'echo "Installing ruby..."'
execute "wget -O - http://apt.hellobits.com/hellobits.key | sudo apt-key add -"
execute "echo 'deb http://apt.hellobits.com/ precise main' | sudo tee /etc/apt/sources.list.d/hellobits.list"
execute "apt-get -y update"
execute "apt-get install -y ruby-2.1 autoconf automake bison libc6-dev libffi-dev libreadline6 libreadline6-dev libsqlite3-dev libssl-dev libtool libxml2-dev libxslt-dev libxslt1-dev libyaml-dev ncurses-dev sqlite3 zlib1g zlib1g-dev"
execute "gem update --system"
execute "gem install bundler --no-ri --no-rdoc"