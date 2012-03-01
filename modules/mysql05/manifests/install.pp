
class mysql05::install {

    require mysql05::params

    package { "mysql-client":
        name   => "${mysql05::params::pkg_name_client}",
        ensure => installed,
    }

    package { "mysql-server":
        name   => "${mysql05::params::pkg_name_server}",
        ensure => installed,
    }

    file { "mysql":
        path    => "${mysql05::params::config_file}",
        ensure  => present,
        owner   => 'mysql',
        group   => 'mysql',
        mode    => '0644',
        content => template("mysql05/my.cnf.erb"),
        require => Package["mysql-server"],
    }

    service { "mysql":
        name   => "${mysql05::params::service_name}",
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

