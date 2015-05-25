class java8 {
    file { '/home/vagrant/java8.sh':
        owner => 'vagrant',
        group => 'vagrant',
        source => 'puppet:///modules/java8/java8.sh',
    }

    package { "libswt-gtk-3-java":
        ensure => "installed";
    }

    package { "libswt-gtk-3-jni":
        ensure => "installed";
    }
}
