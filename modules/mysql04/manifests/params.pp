
class mysql04::params {

    $pkg_name_client = $operatingsystem ? {
        redhat     => "mysql",
        centos     => "mysql",
        default    => "mysql",
    }

    $pkg_name_server = $operatingsystem ? {
        redhat     => "mysql-server",
        centos     => "mysql-server",
        default    => "mysql-server",
    }

    $service_name = $operatingsystem ? {
        redhat     => "mysqld",
        centos     => "mysqld",
        default    => "mysqld",
    }

    $config_dir = $operatingsystem ? {
        freebsd => "/usr/local/etc/",
        redhat  => "/etc/",
        centos  => "/etc/",
        debian  => "/etc/mysql",
        ubuntu  => "/etc/mysql",
        default => "/etc/",
    }

    $config_file = $operatingsystem ? {
        default => "${config_dir}/my.cnf",
    }

}


