
class mysql05::absent {

    require mysql05::params

    # package { "mysql-client":
    #     name   => "${mysql05::params::pkg_name_client}",
    #     ensure => absent,
    # }

    file { "mysql":
        path    => "${mysql05::params::config_file}",
        ensure  => absent,
        require => Package["mysql-server"],
    }

    package { "mysql-server":
        name    => "${mysql05::params::pkg_name_server}",
        ensure  => absent,
        require => Service["mysql"],
    }

    service { "mysql":
        name   => "${mysql05::params::service_name}",
        ensure  => stopped,
    }

}

