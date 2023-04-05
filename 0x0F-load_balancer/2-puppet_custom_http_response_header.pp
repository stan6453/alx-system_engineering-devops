#install and configure an nginx server using the requirements below:
# - Nginx should be listening on port 80
# - When querying Nginx at its root / with a GET request (requesting a page)
#   using curl, it must return a page that contains the string Hello World!
# - The redirection must be a “301 Moved Permanently”

exec { 'apt-get update':
  command => 'apt-get update',
  path    => ['/usr/bin', '/usr/sbin'],
}

# exec { 'apt-get install nginx':
#   command => 'apt-get install nginx -y',
#   path    => ['/usr/bin', '/usr/sbin'],
# }

package { 'nginx':
  ensure   => 'installed',
  name     => 'nginx',
  provider => 'apt',
}

file { '/var/www/html/index.nginx-debian.html':
  ensure  => 'present',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'Hello World!',
  mode    => '0744',
}

file { '/var/www/html/404.html':
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => "Ceci n'est pas une page",
}

file_line { 'add 301 redirection':
  path  => '/etc/nginx/sites-available/default',
  match => '# pass PHP scripts to FastCGI server',
  line  => "
	location /redirect_me {
		return 301 https://quickref.me/bash;
	}

	# pass PHP scripts to FastCGI server",
}

file_line { 'add 404 not found page':
  path  => '/etc/nginx/sites-available/default',
  match => '# pass PHP scripts to FastCGI server',
  line  => "
	error_page 404 /404.html;
	location = /404.html {
		internal;
	}

	# pass PHP scripts to FastCGI server",
}

file_line { 'add HTTP header X-Served-By':
  path  => '/etc/nginx/sites-available/default',
  match => '^server {',
  line  => "
server {
 	add_header X-Served-By \$HOSTNAME;",
}

exec { 'sudo service nginx restart':
  command => 'sudo service nginx restart',
  path    => ['/usr/bin', '/usr/sbin'],
}

service { 'nginx':
  ensure  => 'running',
  name    => 'nginx',
  enable  => 'true',
  start   => 'sudo service nginx start',
  stop    => 'sudo service nginx stop',
  restart => 'sudo service nginx restart',
}

