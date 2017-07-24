class corp104_aws_agent::install inherits corp104_aws_agent {
  if $corp104_aws_agent::proxy_install_manage {
    exec { 'download_aws-agent':
      command => "/usr/bin/curl -x ${corp104_aws_agent::http_proxy} --connect-timeout ${corp104_aws_agent::proxy_install_manage_timeout} -o ${corp104_aws_agent::aws_tmp_file} -O ${corp104_aws_agent::aws_agent_download_url}",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $corp104_aws_agent::aws_tmp_file
    }
  }
  else {
    exec { 'download_aws-agent':
      command => "/usr/bin/curl -o ${corp104_aws_agent::aws_tmp_file} --connect-timeout ${corp104_aws_agent::proxy_install_manage_timeout} -O ${corp104_aws_agent::aws_agent_download_url}",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $corp104_aws_agent::aws_tmp_file
    }
  }

  exec { 'install_aws-agent':
    command   => "/bin/bash ${corp104_aws_agent::aws_tmp_file}",
    path      => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    subscribe => Exec['download_aws-agent'],
    creates   => $corp104_aws_agent::awsagent_bin,
  }
}