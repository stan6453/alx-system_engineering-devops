# make changes to our configuration file.

file_line { 'disable PasswordAuthentication and configure private key':
    path    => '~/.ssh/config',
    line    => 'IdentityFile    ~/.ssh/school',
    ensure  => 'present',
}

file_line { 'Disable PasswordAuthentication':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
}