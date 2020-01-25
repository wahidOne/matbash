sudo mkdir -p /var/www/$1/public_html
sudo chown -R $USER:$USER /var/www/$1/public_html
sudo chmod -R 755 /var/www

sudo su << EOF1

#sudo nano /var/www/kelascilsy.com/public_html/index.html
cat <<EOF2 >/var/www/$1/public_html/index.html
<html>
<head>
<title>Selamat Datang di $1</title>
</head>
<body>
<h1>$1 sudah berhasil di Virtual Host</h1>
</body>
</html>
EOF2

#sudo nano /etc/apache2/sites-available/kelascilsy.com.conf
cat <<EOF3 > /etc/apache2/sites-available/$1.conf
<VirtualHost *:80>
ServerAdmin admin@$1
ServerName $1
ServerAlias www.$1
DocumentRoot /var/www/$1/public_html
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF3


cat <<EOF4 >> /etc/hosts
127.0.0.1 $1
EOF4

EOF1

sudo a2ensite $1.conf

sudo a2dissite 000-default.conf

sudo systemctl restart apache2
