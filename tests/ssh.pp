ssh::client { "conf":
    host           => "*",
    rsa_auth       => "yes",
    password_auth  => "yes",
    protocol       => "2",
    escape_char    => "~",
}

