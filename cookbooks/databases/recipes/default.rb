execute %Q{ sudo -u postgres psql -c "create database #{node[:databases][:development]} owner postgres;" }
execute %Q{ sudo -u postgres psql -c "create database #{node[:databases][:test]} owner postgres;" }