# == Class: sickbeard::install
class sickbeard::install() inherits sickbeard::params {
  ensure_packages(['git', 'python', 'python-cheetah'])

  if ($sickbeard::manage_user) {
      user { $sickbeard::user:
        ensure => present,
        shell  => $sickbeard::user_shell,
        home   => $sickbeard::data_dir,
      }
  }

  vcsrepo { $sickbeard::install_dir:
    ensure   => present,
    provider => git,
    source   => $sickbeard::repo,
    owner    => $sickbeard::user,
    group    => $sickbeard::user,
    require  => [ User[$sickbeard::user], Package['git'] ]
  }

  file { $sickbeard::data_dir:
    ensure  => directory,
    mode    => '0755',
    owner   => $sickbeard::user,
    group   => $sickbeard::user,
    require => User[$sickbeard::user]
  }

  file { $sickbeard::shows_dir:
    ensure  => directory,
    mode    => '0755',
    owner   => $sickbeard::user,
    group   => $sickbeard::user,
    require => User[$sickbeard::user]
  }
}
