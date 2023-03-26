# make changes to our configuration file. Set up your client SSH configuration
#file so that you can connect to a server without typing a password.
# 
# Requirements:
# Your SSH client configuration must be configured to use the private key ~/.ssh/school
# Your SSH client configuration must be configured to refuse to authenticate using a password

ssh_authorized_key { 'school':
    ensure => 'present',
    name   => 'school',
    type   => 'ssh-rsa',
  }

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