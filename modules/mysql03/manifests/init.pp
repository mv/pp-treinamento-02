
class mysql03 {

    package { "mysql-client":
        name   => "mysql",
        ensure => installed,
    }

    package { "mysql-server":
        ensure => installed,
    }

    file { "my.cnf":
        path    => "/etc/my.cnf",
        ensure  => present,
        owner   => 'mysql',
        group   => 'mysql',
        mode    => '0644',
        content => template("mysql03/my.cnf.erb"),
        require => Package["mysql-server"],
    }

    service { "mysqld":
        ensure  => running,
        require => File["my.cnf"],
    }

    user { "mysql":
        ensure => present,
        uid    => 27,
        gid    => 27,
        home   => '/var/empty/mysql',
        shell  => '/sbin/nologin',
    }

    group { "mysql":
        ensure => present,
        gid    => 27,
    }

    file { "/var/empty/mysql":
        ensure => directory,
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }


    file { ["/mysql",
            "/mysql/data",
            "/mysql/logs",
            ]:
        ensure => directory,
        owner  => 'mysql',
        group  => 'mysql',
        mode   => '0775',
    }


    file { "/var/lib/mysql":
        ensure => link,
        target => '/mysql',
        force  => true,
    }

}

