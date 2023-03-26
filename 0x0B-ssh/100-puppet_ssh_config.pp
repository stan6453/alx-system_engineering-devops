file { '~/.ssh/school'
    path    => '~/.ssh/school'
    content => '
    Host    alxserver
        Hostname        52.201.220.51
        User    ubuntu
        IdentityFile    ~/.ssh/school
    '
}