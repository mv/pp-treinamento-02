
## site.pp


node /centos57/ {
    $environment = 'prod'
    include mysql03
}

node /ws/ {

    include mysql06::client::install

}

node /db/ {

    $environment = 'prod'
    include mysql06::client::install
    include mysql06::server::install

}


