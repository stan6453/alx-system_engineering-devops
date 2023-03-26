# make changes to our configuration file. Set up your client SSH configuration
#file so that you can connect to a server without typing a password.
# 
# Requirements:
# Your SSH client configuration must be configured to use the private key ~/.ssh/school
# Your SSH client configuration must be configured to refuse to authenticate using a password

$pub_key = @('KEY'/L)
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDa6FbFqmpM1uEFrMPHdw7ooPvbvf3Ez+YqxXiIW+gabfDoUqiJ1IR5wCI\
    o+XMmJwjk+Yr+VF6XQGjN3ECzhU0yy3VXxdUKKqYO4AycdNC6aynJFrKlGoAOPbx5Tn4Qz763QuDHDDhGmheQL4zluen2IP1W52NSD+rWPuRbag\
    B586eYRQJo+5bab27o3/wROTtRsCQa+VzqSbKhKB6QOlgdn3Z3ztwObSYyQcPv6jGQjwldQB2KwsMI7Z3VcNARIVy4lkSdJKJ2l6Ooim/19bif9\
    HfXhkXdcN4wYM0CqG1KazX3RW7rIlLsbjE9WWzZQ/ZYHVqIZYinEQxMeqL/harL9ouDR6XPhbojL2I1b8up311t2vTmW7t1OgfRXSD+DqZ5sxIh\
    KxsfGbKkeJtXsDnyZMWlvwbxQIcsoy33KFFgZdxhAeLsHNTZoeQjWtMH4EV7ASWNuwT1t9JTlq4B4rhdLRWaKsYYP7ktI1c4zcGs8vaIvq1nYcW\
    08DvVYzarJI8= stanley@kali
    | KEY

$config_content = @('CON'/L)
        PasswordAuthentication no
        IdentityFile    ~/.ssh/school
    | CON

ssh_authorized_key { 'school':
    ensure => 'present',
    name   => 'school',
    type   => 'ssh-rsa',
    key    => $pub_key,
  }

file_line { '~/.ssh/config':
    path    => '~/.ssh/config',
    content => $config_content,
    ensure  => present
}