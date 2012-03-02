
class mysql06::params {

    $pkg_name_client = $operatingsystem ? {
        redhat  => "mysql",
        centos  => "mysql",
        ubuntu  => "mysql-client",
        debian  => "mysql-client",
        freebsd => "mysql-client-5.5.20",
        default => "mysql",
    }

    $depend_on_client = $operatingsystem ? {
        redhat  => "perl-DBD-MySQL",
        centos  => "perl-DBD-MySQL",
        default => "",
    }

    $pkg_name_server = $operatingsystem ? {
        freebsd => "mysql-server-5.5.20",
        default => "mysql-server",
    }

    $depend_on_server = $operatingsystem ? {
        default => "",
    }

    $service_name = $operatingsystem ? {
        default => "mysqld",
    }

    $config_dir = $operatingsystem ? {
        freebsd => "/usr/local/etc",
        debian  => "/etc/mysql",
        ubuntu  => "/etc/mysql",
        default => "/etc/",
    }

    $config_file = $operatingsystem ? {
        default => "${config_dir}/my.cnf",
    }

}


