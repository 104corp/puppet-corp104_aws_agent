class corp104_aws_agent::service inherits corp104_aws_agent {
  if $corp104_aws_agent::manage_service {
    case $facts['osfamily'] {
      'Debian': {
        service { $corp104_aws_agent::service_name:
          ensure    => running,
          subscribe => Class['corp104_aws_agent::install'],
          require   => Class['corp104_aws_agent::install'],
        }
      }
      'RedHat': {
        service { $corp104_aws_agent::service_name:
          ensure    => running,
          subscribe => Package['aws_agent'],
          require   => Class['corp104_aws_agent::install'],
        }
      }
      default: {
        service { $corp104_aws_agent::service_name:
          ensure     => running,
          hasstatus  => true,
          hasrestart => true,
          restart    => "/sbin/restart ${corp104_aws_agent::service_name}",
          start      => "/sbin/start ${corp104_aws_agent::service_name}",
          status     => "/sbin/status ${corp104_aws_agent::service_name}",
          stop       => "/sbin/stop ${corp104_aws_agent::service_name}",
          subscribe  => Class['corp104_aws_agent::install'],
          require    => Class['corp104_aws_agent::install'],
        }
      }
    }
  }
}
