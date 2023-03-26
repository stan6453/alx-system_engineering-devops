# make changes to our configuration file. Set up your client SSH configuration

ssh_authorized_key { 'school':
    ensure => 'present',
    name   => 'school',
    type   => 'ssh-rsa',
  }

file_line { 'disable PasswordAuthentication and configure private key':
    path    => '~/.ssh/config',
    line    => '    IdentityFile    ~/.ssh/school',
    ensure  => 'present',
}

file_line { 'Disable PasswordAuthentication':
  ensure => 'present',
  path   => '   /etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no',
}