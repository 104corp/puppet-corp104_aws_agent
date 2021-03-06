# Class: corp104_aws_agent
# ===========================
#
# Full description of class corp104_aws_agent here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'corp104_aws_agent':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class corp104_aws_agent (
  String $aws_agent_download_url,
  String $aws_tmp_file,
  Boolean $proxy_install_manage,
  String $proxy_install_manage_timeout,
  Optional[String] $http_proxy,
  Optional[String] $no_proxy,
  String $package_name,
  String $package_provider,
  Boolean $manage_service,
  String $service_name,
  String $awsagent_bin,
) {
  contain corp104_aws_agent::install
  contain corp104_aws_agent::service

  Class['::corp104_aws_agent::install']
  ~> Class['::corp104_aws_agent::service']
}

