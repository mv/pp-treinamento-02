
class mysql06 {

    # Parameters by operating system
    require mysql06::params

    # Default: only install client
    include mysql06::client::install

}

