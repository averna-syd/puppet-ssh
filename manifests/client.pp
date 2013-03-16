# ssh::client
#
# Manages ssh_config
#
# Params:
#   $host           - optional - regex (default: *)
#   $rsa_auth       - optional - yes|no (default: yes)
#   $password_auth  - optional - yes|no (default: yes)
#   $protocol       - optional - int (default: 2)
#   $escape_char    - optional - char (default: ~)
#
# Usage:
#  ssh::client { "conf":
#    host           => "*",
#    rsa_auth       => "yes",
#    password_auth  => "yes",
#    protocol       => "2",
#    escape_char    => "~",
#  }

define ssh::client (
    $host           = "*",
    $rsa_auth       = "yes",
    $password_auth  = "yes",
    $protocol       = "2",
    $escape_char    = "~",

) {

    ssh_base { "conf":
        host   => $host,
        rsa_auth        => $rsa_auth,
        password_auth   => $password_auth,
        protocol        => $protocol,
        escape_char     => $escape_char,
    }
}

