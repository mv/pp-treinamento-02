
class mysql06::absent {

    # Parameters by operating system
    require mysql05::params

    # Default: remove client
    include mysql06::client::remove

}

