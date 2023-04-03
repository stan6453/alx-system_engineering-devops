#install and configure an nginx server using the requirements below:
# - Nginx should be listening on port 80
# - When querying Nginx at its root / with a GET request (requesting a page)
#   using curl, it must return a page that contains the string Hello World!
# - The redirection must be a “301 Moved Permanently”

package { 'nginx':
  ensure   => 'installed',
  name     => 'nginx',
  provider => 'apt',
}

file { '/var/www/html/index.nginx-debian.html':
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'Hello World!',
}

file { '/var/www/html/404.html':
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => "Ceci n'est pas une page",
}

file-line { 'add multiple lines':
  path  => '/etc/nginx/sites-available/default',
  match => 'server_name _;',
  line  => [
    'server_name _;',
    'location /redirect_me {',
    "return 301 'https':#quickref.me/bash;",
    '}',
  ],
}

file-line { 'add multiple lines':
  path  => '/etc/nginx/sites-available/default',
  match => 'server_name _;',
  line  => [
    'server_name _;',
    'error_page 404 /404.html;',
    'location = /404.html {',
    'internal;',
    '}',
  ],
}

service { 'sudo service nginx restart':
  ensure  => 'running',
  name    => 'nginx',
  enabled => 'true',
  start   => 'sudo service nginx start',
  stop    => 'sudo service nginx stop',
  restart => 'sudo service nginx restart',
}
