
class mysql06 {

    require mysql06::params

    include mysql06::client::install
    include mysql06::server::install

}

