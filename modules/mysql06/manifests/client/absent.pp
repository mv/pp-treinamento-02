
class mysql06::client::absent {

    require mysql06::params

    package { "mysql-client":
        name    => "${mysql06::params::pkg_name_client}",
        ensure  => absent,
        require => Package["depend-on-client"],
    }

    package { "depend-on-client":
        name   => "${mysql06::params::depend_on_client}",
        ensure => absent,
    }

}

