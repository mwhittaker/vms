class ocaml {
    file { '/home/vagrant/ocaml.sh':
        owner => 'vagrant',
        group => 'vagrant',
        source => 'puppet:///modules/ocaml/ocaml.sh',
    }

    package { "aspcud":
        ensure => "installed",
    }

    package { "m4":
        ensure => "installed",
    }

    package { "unzip":
        ensure => "installed",
    }
}
