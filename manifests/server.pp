# ssh::server
#
# Manages sshd
#
# params:
#   $port           - optional - int (defaut: 22)
#   $listen_ipv4    - optional - ipv4 adr (default: 0.0.0.0)
#   $protocol       - optional - 1|2 (default: 2)
#   $rsa_auth       - optional - yes|no (default: yes)
#   $pub_key        - optional - yes|no (default: yes)
#   $permit_root    - optional - yes|no (default: no)
#   $password_auth  - optional - yes|no (default: no)
#   $xforward       - optional - yes|no (default: no)
#   $sftp_subsystem - optional - str (default: sftp   internal-sftp)
#   $sftp_group     - optional - char (default: sftponly)
#   $chroot_dir     - optional - char (default: %h)
#   $force_command  - optional - char (default: internal-sftp)
#   $ensure         - required - running|stopped
#
# Usage:
#  ssh::server { "conf":
#    port           => "22",
#    listen_ipv4    => "0.0.0.0",
#    rsa_auth       => "yes",
#    password_auth  => "yes",
#    permit_root    => "no",
#    ensure         => "running",
#    
#  }

define ssh::server (
    $port               = "22",
    $listen_ipv4        = "0.0.0.0",
    $protocol           = "2",
    $rsa_auth           = "yes",
    $pub_key            = "yes",
    $permit_root        = "no",
    $password_auth      = "no",
    $xforward           = "no",
    $rhostbased_auth    = "no",
    $hostbased_auth     = "no",
    $sftp_subsystem     = "sftp   internal-sftp",
    $sftp_group         = "sftponly",
    $chroot_dir         = "%h",
    $force_command      = "internal-sftp -u 0077",
    $ensure,
) {
    sshd_base { "conf":
        port            => $port,
        listen_ipv4     => $listen_ipv4,
        protocol        => $protocol,
        rsa_auth        => $rsa_auth,
        pub_key         => $pub_key,
        permit_root     => $permit_root,
        password_auth   => $password_auth,
        xforward        => $xforward,
        rhostbased_auth => $rhostbased_auth,
        hostbased_auth  => $hostbased_auth,
        sftp_subsystem  => $sftp_subsystem,
        sftp_group      => $sftp_group,
        chroot_dir      => $chroot_dir,
        force_command   => $force_command,
        ensure          => $ensure,
    }
}
