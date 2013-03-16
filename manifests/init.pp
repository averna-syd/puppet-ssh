# ssh
#
# This module manages sshd and ssh

class ssh {
    case $operatingsystem {
        centos, redhat: { }
        default: { fail("Uknown operating system. This currently only supports rhel & centos.") }
    }
}

# sshd_base
#
# params:
#   $port               - optional - int (defaut: 22)
#   $listen_ipv4        - optional - ipv4 adr (default: 0.0.0.0)
#   $protocol           - optional - 1|2 (default: 2)
#   $rsa_auth           - optional - yes|no (default: yes)
#   $pub_key            - optional - yes|no (default: yes)
#   $permit_root        - optional - yes|no (default: no)
#   $password_auth      - optional - yes|no (default: no)
#   $xforward           - optional - yes|no (default: no)
#   $hostbased_auth     - optional - yes|no (default: no)
#   $rhostbased_auth    - optional - yes|no (default: no)
#   $ensure             - required - running|stopped

define sshd_base (
    $port,
    $listen_ipv4,
    $protocol,
    $rsa_auth,
    $pub_key,
    $permit_root,
    $password_auth,
    $xforward,
    $rhostbased_auth,
    $hostbased_auth,
    $sftp_subsystem,
    $sftp_group,
    $chroot_dir,
    $force_command,
    $ensure,
) {

    package { "openssh-server":
        ensure => latest,
    }

    service { "sshd":
        enable      => true,
        ensure      => $ensure,
        hasstatus   => true,
        hasrestart  => true,
        require     => Package["openssh-server"],
    }

    file { "sshd_config":
        mode    => "0600",
        owner   => "root",
        group   => "root",
        audit   => all,
        ensure  => "present",
        path    => "/etc/ssh/sshd_config",
        content => template("ssh/sshd_config.erb"),
        notify  => Service["sshd"],
        require => Package["openssh-server"],
    }

    file { "banner":
        ensure  => file,
        replace => true,
        path    => "/etc/ssh/banner",
        source  => "puppet:///modules/ssh/banner",
        require => Package["openssh-server"],
    }
}


# sshd_base
#
# ssh client conf is currently mostly static but can be easily templated futher as required.
#
# params:
#   $host           - optional - regex (default: *)
#   $rsa_auth       - optional - yes|no (default: yes)
#   $pass_auth      - optional - yes|no (default: yes)
#   $protocol       - optional - int (default: 2)
#   $escape_char    - optional - char (default: ~)

define ssh_base (
    $host,
    $rsa_auth,
    $password_auth,
    $protocol,
    $escape_char,
) {

    package { "openssh-clients":
        ensure => latest,
    }

    file { "ssh_config":
        mode    => "0600",
        owner   => "root",
        group   => "root",
        audit   => all,
        ensure  => "present",
        path    => "/etc/ssh/ssh_config",
        content => template("ssh/ssh_config.erb"),
        require => Package["openssh-clients"],
    }
}


