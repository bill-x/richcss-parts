# Setting Up Vagrant

1. [Install Vagrant](http://www.vagrantup.com/downloads.html)
2. [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
3. Install Vagrant plugins:
   * `vagrant plugin install vagrant-vbguest`
   * `vagrant plugin install vagrant-librarian-chef`
   * `vagrant plugin install vagrant-omnibus`
4. Go to root project directory and run `vagrant up` (This may take a while the first time...)
5. After running `vagrant ssh`, you should be logged in to the server!


# Start 'er up

1. Go to the root project directory (which is located at `/vagrant/`) in the VM
2. Run `npm install -g bower` to install bower
3. Run `bundle install` to install required gems
4. Run `rake bower:install` to install the JS dependencies
5. Run `rake assets:precompile` to precompile the assets
6. You also need to create the database if you didn't, `rake db:create` or else run `rake db:migrate`
7. Now, you should be able to start the server with `rails server`
8. Visit [http://localhost:3000](http://localhost:3000) on your local computer to check it out!

# Troubleshooting/Other things

* `vagrant reload` if there were changes to the Vagrantfile
* `vagrant provision` if there were changes to bootstrap.sh or new Chef cookbooks
* If all else fails, `vagrant destory` and restart again :)
