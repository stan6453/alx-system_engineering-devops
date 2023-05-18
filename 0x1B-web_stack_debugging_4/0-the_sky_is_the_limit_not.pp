# increase number of files nginx can handle simultaneously

exec { 'increase ulimit':
  command => 'sed -i "s/15/25000/" /etc/default/nginx',
  path    => ['/usr/local/bin/', '/bin/'],
}

exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => ['/etc/init.d/', '/usr/sbin/'],
}
