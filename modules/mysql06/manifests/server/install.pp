
class mysql06::server::install {

    require mysql06::params

    package { "mysql-server":
        name   => "${mysql06::params::pkg_name_server}",
        ensure => installed,
    }

    file { "mysql":
        path    => "${mysql06::params::config_file}",
        ensure  => present,
        owner   => 'mysql',
        group   => 'mysql',
        mode    => '0644',
        content => template("mysql06/my.cnf.erb"),
        require => Package["mysql-server"],
    }

    service { "mysql":
        name   => "${mysql06::params::service_name}",
        ensure  => running,
        require => File["mysql"],
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

