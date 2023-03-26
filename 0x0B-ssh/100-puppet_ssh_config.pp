# make changes to our configuration file. Set up your client SSH configuration
file_line { 'IdentityFile':
    ensure => 'present',
    path   => '/etc/ssh/ssh_config',
    line   => '    IdentityFile    ~/.ssh/school',
}

file_line { 'Disable PasswordAuthentication':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => '    PasswordAuthentication no',
}