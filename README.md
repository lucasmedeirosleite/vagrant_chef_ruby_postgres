# Vagrant + Chef Solo + Berkshelf + Ruby 2.1 + PostgreSQL

This is a vagrant base project which has two machines, one for the postgres database and other for the ruby based applications

All cookbooks are managed with [berkshelf](https://github.com/berkshelf/berkshelf)

## Installation

You will need:

* vagrant (1.2.7)
* You need to install the vagrant-berkshelf plugin with: **vagrant plugin install vagrant-berkshelf**

**NOTE:** vagrant-berkshelf does not work on vagrant 1.4.x (not tested on 1.3.x series)

##Starting the machines

Just run: **vagrant up**

##Database machine

The database machine has one postgres server which can de accessed on ip 192.168.50.4 on port 5432

It has the following cookbooks:

* [apt](http://community.opscode.com/cookbooks/apt)
* [build-essential](http://community.opscode.com/cookbooks/build-essential)
* [openssl](http://community.opscode.com/cookbooks/openssl)
* [locale](http://community.opscode.com/cookbooks/locale)
* [postgresql](http://community.opscode.com/cookbooks/postgresql)

##Ruby machine

The ruby machine has its port 3000 'forwarded' to host port 3000

It has the following cookbooks:

* [apt](http://community.opscode.com/cookbooks/apt)
* [build-essential](http://community.opscode.com/cookbooks/build-essential)
* [openssl](http://community.opscode.com/cookbooks/openssl)

And it also has installed:
 
* python-software-properties
* git
* imagemagick
* postgresql-client-9.1
* ruby 2.1
* ruby gem pg (for postgresql integration)

## Accessing the database via pgAdmin

If you would like to access the database via pg admin you just need to create a new server with:

* host: 192.168.50.4 (feel free to change this address on the Vagrantfile)
* port: 5432
* username: postgres
* password: postgres (feel free to change this password on the roles/configuration.json)

## Configuring database.yml (if using rails)

You should put this on your project database.yml

```yaml

development:
  adapter: postgresql
  encoding: unicode
  database: development_database
  pool: 5
  host: 192.168.50.4
  username: postgres
  password: postgres  

test:
  adapter: postgresql
  encoding: latin1
  database: test_database
  pool: 5
  host: 192.168.50.4
  username: postgres
  password: postgres

```

NOTE: You can change the database names on the 'databases' node of the configuration.json file. (This is important because the database is not on the ruby machine, so they need to be created manually on the database machine, the command rake db:create will not work because of that)


##Contact:

Developed by [Lucas Medeiros](https://www.twitter.com/aspmedeiros)
E-mail: lucastoc@gmail.com

