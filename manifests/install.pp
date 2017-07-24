class aws_agent::install inherits aws_agent {
  if $aws_agent::proxy_install_manage {
    exec { 'download_aws-agent':
      command => "/usr/bin/curl -x ${aws_agent::http_proxy} --connect-timeout ${aws_agent::proxy_install_manage_timeout} -o ${aws_agent::aws_tmp_file} -O ${aws_agent::aws_agent_download_url}",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $aws_agent::aws_tmp_file
    }
  }
  else {
    exec { 'download_aws-agent':
      command => "/usr/bin/curl -o ${aws_agent::aws_tmp_file} --connect-timeout ${aws_agent::proxy_install_manage_timeout} -O ${aws_agent::aws_agent_download_url}",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $aws_agent::aws_tmp_file
    }
  }

  exec { 'install_aws-agent':
    command   => "/bin/bash ${aws_agent::aws_tmp_file}",
    path      => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    subscribe => Exec['download_aws-agent'],
    creates   => $aws_agent::awsagent_bin,
  }
}