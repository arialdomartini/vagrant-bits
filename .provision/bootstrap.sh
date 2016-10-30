#!/bin/bash

# install nginx
sudo apt-get update
sudo apt-get -y install nginx

# setup nginx to serve site
sudo rm /etc/nginx/sites-enabled/default

host_nginx_conf=/vagrant/.provision/nginx/nginx.conf
guest_nginx_conf=/etc/nginx/sites-available/site.conf

sudo cp ${host_nginx_conf} ${guest_nginx_conf}
sudo chmod 644 ${guest_nginx_conf}
sudo ln -s ${guest_nginx_conf} /etc/nginx/sites-enabled/site.conf

# copy site content
sudo rm -fr /var/www/*
sudo cp -r /vagrant/site /var/www

# start nginx
sudo service nginx start



