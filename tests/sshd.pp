include ssh

ssh::server { "conf":
    port               => "22",
    listen_ipv4        => "0.0.0.0",
    protocol           => "2",
    rsa_auth           => "yes",
    pub_key            => "yes",
    permit_root        => "no",
    password_auth      => "no",
    xforward           => "no",
    rhostbased_auth    => "no",
    hostbased_auth     => "no",
    ensure             => "running",
}

