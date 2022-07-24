#!/usr/bin/env bash
sudo systemctl stop apache2
sudo rm -rf /var/www/gavva.site/wordpress
rm -rf ~/wp/wordpress/.git
sudo mv ~/wp/wordpress /var/www/gavva.site/wordpress
sudo chown -R www-data:www-data /var/www
sudo systemctl start apache2