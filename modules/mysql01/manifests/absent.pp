
class mysql01::absent {

    package { "mysql-client":
        name   => "${mysql01::params::pkg_name_client}",
        ensure => absent,
    }

    package { "mysql-server":
        name   => "${mysql01::params::pkg_name_server}",
        ensure => absent,
    }

    file { "mysql":
        path    => "${mysql01::params::config_file}",
        ensure  => absent,
    }

    service { "mysql":
        name   => "${mysql01::params::service_name}",
        ensure  => stopped,
    }

    user { "mysql":
        ensure => absent,
    }

    group { "mysql":
        ensure => absent,
    }

}

