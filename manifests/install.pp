# == Class: sickbeard::install
class sickbeard::install() inherits sickbeard::params {
  package { 'python-cheetah':
    ensure => present,
  }

  user { $sickbeard::user:
    ensure => present,
    shell  => $sickbeard::user_shell,
  }

  vcsrepo { $sickbeard::install_dir:
    ensure   => present,
    provider => git,
    source   => $sickbeard::repo,
    owner    => $sickbeard::user,
    group    => $sickbeard::user,
    require  => User[$sickbeard::user]
  }

  # TODO make this work on non-Debian platforms
  if $::osfamily == 'Debian' {
    file { '/etc/init.d/sickbeard':
      ensure => present,
      source => 'puppet:///modules/sickbeard/debian.init',
      mode   => '0755',
    }
  }

  file { $sickbeard::data_dir:
    ensure => directory,
    mode   => '0755',
    owner  => $sickbeard::user,
    group  => $sickbeard::user,
    require  => User[$sickbeard::user]
  }

  file { $sickbeard::shows_dir:
    ensure => directory,
    mode   => '0755',
    owner  => $sickbeard::user,
    group  => $sickbeard::user,
    require  => User[$sickbeard::user]
  }
}
