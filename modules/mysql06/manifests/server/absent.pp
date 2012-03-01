
class mysql06::server::absent {

    require mysql06::params

    # package { "mysql-client":
    #     name   => "${mysql06::params::pkg_name_client}",
    #     ensure => absent,
    # }

    file { "mysql":
        path    => "${mysql06::params::config_file}",
        ensure  => absent,
        require => Package["mysql-server"],
    }

    package { "mysql-server":
        name    => "${mysql06::params::pkg_name_server}",
        ensure  => absent,
        require => Service["mysql"],
    }

    service { "mysql":
        name   => "${mysql06::params::service_name}",
        ensure  => stopped,
    }

}

