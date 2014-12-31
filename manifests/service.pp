# == Class: sickbeard::service
class sickbeard::service {
  if $::osfamily == 'Debian' {
    service { 'sickbeard':
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
