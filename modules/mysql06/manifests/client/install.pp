
class mysql06::client::install {

    require mysql06::params

    package { "mysql-client":
        name   => "${mysql06::params::pkg_name_client}",
        ensure => installed,
    }

}

