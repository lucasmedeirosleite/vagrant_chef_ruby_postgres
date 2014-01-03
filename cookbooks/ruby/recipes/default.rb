execute "wget -O - http://apt.hellobits.com/hellobits.key | sudo apt-key add -"
execute "echo 'deb http://apt.hellobits.com/ precise main' | sudo tee /etc/apt/sources.list.d/hellobits.list"
execute "apt-get -y update"

if node[:ruby][:version]
  case node[:ruby][:version] 
  when "1.9"
  	execute "apt-get install -y ruby-ichi"
  when "2.0"
  	execute "apt-get install -y ruby-ni"
  else
  	execute "apt-get install -y ruby-2.1"
  end
else
	execute "apt-get install -y ruby-2.1"
end

execute "apt-get install -y autoconf automake bison libc6-dev libffi-dev libreadline6 libreadline6-dev libsqlite3-dev libssl-dev libtool libxml2-dev libxslt-dev libxslt1-dev libyaml-dev ncurses-dev sqlite3 zlib1g zlib1g-dev"
execute "gem update --system"
execute "gem install bundler --no-ri --no-rdoc"