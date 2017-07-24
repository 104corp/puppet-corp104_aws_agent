class aws_agent::service inherits aws_agent {
  if $aws_agent::manage_service {
    case $facts['osfamily'] {
      'Debian': {
        service { $aws_agent::service_name:
          ensure    => running,
          subscribe => Class['aws_agent::install'],
          require   => Class['aws_agent::install'],
        }
      }
      'RedHat': {
        service { $aws_agent::service_name:
          ensure    => running,
          subscribe => Package['aws_agent'],
          require   => Class['aws_agent::install'],
        }
      }
      default: {
        service { $aws_agent::service_name:
          ensure     => running,
          hasstatus  => true,
          hasrestart => true,
          restart    => "/sbin/restart ${aws_agent::service_name}",
          start      => "/sbin/start ${aws_agent::service_name}",
          status     => "/sbin/status ${aws_agent::service_name}",
          stop       => "/sbin/stop ${aws_agent::service_name}",
          subscribe  => Class['aws_agent::install'],
          require    => Class['aws_agent::install'],
        }
      }
    }
  }
}
