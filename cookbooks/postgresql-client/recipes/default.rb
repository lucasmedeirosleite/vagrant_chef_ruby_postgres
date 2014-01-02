execute "add-apt-repository ppa:pitti/postgresql"
execute "apt-get -y update"
execute "apt-get -y install postgresql-client-#{node[:postgresql][:version]} libpq-dev"