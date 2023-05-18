# increase number of files nginx can handle simultaneously

exec { 'increase ulimit':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => ['/usr/local/bin/', '/bin/'],
}

exec { 'restart-nginx':
  command => 'sudo service nginx restart',
  path    => ['/usr/local/bin/', '/bin/', '/usr/bin/'],
}
