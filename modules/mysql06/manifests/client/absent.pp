
class mysql06::client::absent {

    require mysql06::params

    package { "mysql-client":
        name   => "${mysql06::params::pkg_name_client}",
        ensure => absent,
        notify => Package["depend_on_client"],
    }

    package { "depend_on_client":
        name   => "${mysql06::params::depend_on_client}",
        ensure => absent,
    }

}

