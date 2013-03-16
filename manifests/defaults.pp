# ssh::defaults
#
# Allow the default options for when you don't need to config and couldn't be bothered with it.

class ssh::defaults {

    ssh::server { "conf":
        ensure  => "running",
    }

    ssh::client { "conf": }
}

