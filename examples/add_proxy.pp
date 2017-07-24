class { '::aws_agent':
  proxy_install_manage => true,
  http_proxy           => 'http://proxy.com:3128',
  no_proxy             => '169.254.169.254',
}