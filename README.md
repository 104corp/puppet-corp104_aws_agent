# puppet module corp104_aws_agent
[![Build Status](https://travis-ci.org/104corp/puppet-corp104_aws_agent.svg?branch=master)](https://travis-ci.org/104corp/puppet-corp104_aws_agent)

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with aws_agent](#setup)
    * [What aws_agent affects](#what-aws_agent-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with aws_agent](#beginning-with-aws_agent)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The aws agent module installs, configures, and manages the AWS aws agent service across a range of operating systems and distributions.

## Setup

### Beginning with corp104_aws_agent

`include '::corp104_aws_agent'` is enough to get you up and running.

## Usage

All parameters for the ntp module are contained within the main `::corp104_aws_agent` class, so for any function of the module, set the options you want. See the common usages below for examples.

### Install and enable AWS Agent

```puppet
include '::corp104_aws_agent'
```

### Configuring AWS Agent to Use a Proxy

```puppet
class { '::corp104_aws_agent':
  http_proxy  => 'http://change.proxy.com:3128',
  no_proxy    => '169.254.169.254',
}
```

## Reference

### Classes

#### Public classes

* corp104_aws_agent: Main class, includes all other classes.

#### Private classes

* corp104_aws_agent::install: Handles the packages.
* corp104_aws_agent::service: Handles the service.

## Parameters

The following parameters are available in the `::corp104_aws_agent` class:

#### `aws_agent_download_url`

Optional.

Data type: String.

The aws agent download url

Default value: `https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install`

#### `proxy_install_manage`

Optional.

Data type: Boolean.

Enables the use of agents to download the source code

Default value: `false`

#### `proxy_install_manage_timeout`

Optional.

Data type: String.

Connect timeout use of agents to download the source code

Default value: `60`

## Limitations

This module has been tested platform on:

* Red Hat Enterprise Linux (RHEL) 6, 7
* CentOS 6, 7
* Debian 6, 7
* Ubuntu 16.04

## Development

Puppet modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. Please follow our guidelines when contributing changes.

For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

### Contributors

To see who's already involved, see the [list of contributors.](https://github.com/puppetlabs/puppetlabs-ntp/graphs/contributors)
