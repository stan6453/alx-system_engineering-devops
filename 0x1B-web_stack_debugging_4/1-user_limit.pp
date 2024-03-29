# Increase hard limit on holberton.
exec { 'Increase hard limit':
  command => 'sed -i "/holberton hard/s/5/2000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}

# Increase soft limit on holberton
exec { 'Increase soft limit':
  command => 'sed -i "/holberton soft/s/4/1000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
