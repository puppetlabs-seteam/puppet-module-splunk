# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

* [`splunk`](#splunk): This class is unused and doesn't do anything but make default data
accessible
* [`splunk::enterprise`](#splunkenterprise): Install and configure an instance of Splunk Enterprise
* [`splunk::enterprise::config`](#splunkenterpriseconfig): Private class declared by Class[splunk::enterprise] to contain all the
configuration needed for a base install of Splunk Enterprise
* [`splunk::enterprise::install`](#splunkenterpriseinstall): Private class declared by Class[splunk::enterprise] to contain or define
through additional platform specific sub-class, the required steps
for successfully installing Splunk Enterprise
* [`splunk::enterprise::install::nix`](#splunkenterpriseinstallnix): Private class declared by Class[splunk::enterprise::install] to provide
platform specific installation steps on Linux or Unix type systems.
* [`splunk::enterprise::password::manage`](#splunkenterprisepasswordmanage): Implements the direct management of the Splunk Enterprise admin password
so it can be used outside of regular management of the whole stack to
facilitate admin password resets through Bolt Plans.

Note: Entirely done to make this implementation consistent with the method
used to manage admin password seeding.
* [`splunk::enterprise::password::seed`](#splunkenterprisepasswordseed): Implements the seeding and reseeding of the Splunk Enterprise admin password
so it can be used outside of regular management of the whole stack to
facilitate admin password resets through Bolt Plans
* [`splunk::enterprise::service`](#splunkenterpriseservice): Private class declared by Class[splunk::enterprise] to define a service
as its understood by Puppet using a dynamic set of data or platform specific
sub-classes
* [`splunk::enterprise::service::nix`](#splunkenterpriseservicenix): Private class declared by Class[splunk::enterprise::service] to provide
platform specific service management on Linux or Unix type systems.
* [`splunk::forwarder`](#splunkforwarder): Install and configure an instance of Splunk Universal Forwarder
* [`splunk::forwarder::config`](#splunkforwarderconfig): Private class declared by Class[splunk::forwarder] to contain all the
configuration needed for a base install of the Splunk Universal
Forwarder
* [`splunk::forwarder::install`](#splunkforwarderinstall): Private class declared by Class[splunk::forwarder] to contain or define
through additional platform specific sub-class, the required steps
for successfully installing the Splunk Universal Forwarder
* [`splunk::forwarder::password::manage`](#splunkforwarderpasswordmanage): Implements the direct management of the Splunk Forwarder admin password
so it can be used outside of regular management of the whole stack to
facilitate admin password resets through Bolt Plans.

Note: Entirely done to make this implementation consistent with the method
used to manage admin password seeding.
* [`splunk::forwarder::password::seed`](#splunkforwarderpasswordseed): Implements the seeding and reseeding of the Splunk Forwarder admin password
so it can be used outside of regular management of the whole stack to
facilitate admin password resets through Bolt Plans
* [`splunk::forwarder::service`](#splunkforwarderservice): Private class declared by Class[splunk::forwarder] to define a service as
its understood by Puppet using a dynamic set of data or platform specific
sub-classes
* [`splunk::forwarder::service::nix`](#splunkforwarderservicenix): Private class declared by Class[splunk::forwarder::service] to provide
platform specific service management on Linux or Unix type systems.
* [`splunk::params`](#splunkparams): This class takes a small number of arguments (can be set through Hiera) and
generates sane default values installation media names and locations.
Default ports can also be specified here. This is a parameters class, and
contributes no resources to the graph. Rather, it only sets values for
parameters to be consumed by child classes.

**Defined types**

* [`splunk::addon`](#splunkaddon): Defined type for deploying Splunk Add-ons and Apps from either OS packages
or via splunkbase compatible archives

**Resource types**

* [`splunk_alert_actions`](#splunk_alert_actions): Manage splunk alert_actions settings in alert_actions.conf
* [`splunk_authentication`](#splunk_authentication): Manage splunk authentication settings in authentication.conf
* [`splunk_authorize`](#splunk_authorize): Manage splunk authorize settings in authorize.conf
* [`splunk_config`](#splunk_config): splunk config
* [`splunk_deploymentclient`](#splunk_deploymentclient): Manage splunk deploymentclient entries in deploymentclient.conf
* [`splunk_distsearch`](#splunk_distsearch): Manage distsearch entries in distsearch.conf
* [`splunk_indexes`](#splunk_indexes): Manage splunk index settings in indexes.conf
* [`splunk_input`](#splunk_input): Manage splunk input settings in inputs.conf
* [`splunk_limits`](#splunk_limits): Manage splunk limits settings in limits.conf
* [`splunk_metadata`](#splunk_metadata): Manage metadata entries in {default,local}.meta
* [`splunk_output`](#splunk_output): Manage splunk output settings in outputs.conf
* [`splunk_props`](#splunk_props): Manage splunk prop settings in props.conf
* [`splunk_server`](#splunk_server): Manage splunk server settings in server.conf
* [`splunk_serverclass`](#splunk_serverclass): Manage splunk serverclass entries in serverclass.conf
* [`splunk_transforms`](#splunk_transforms): Manage splunk transforms settings in transforms.conf
* [`splunk_uiprefs`](#splunk_uiprefs): Manage splunk web ui settings in ui-prefs.conf
* [`splunk_web`](#splunk_web): Manage splunk web settings in web.conf
* [`splunkforwarder_deploymentclient`](#splunkforwarder_deploymentclient): Manage splunkforwarder deploymentclient entries in deploymentclient.conf
* [`splunkforwarder_input`](#splunkforwarder_input): Manage splunkforwarder input settings in inputs.conf
* [`splunkforwarder_limits`](#splunkforwarder_limits): Manage splunkforwarder limit settings in limits.conf
* [`splunkforwarder_output`](#splunkforwarder_output): Manage splunkforwarder output settings in outputs.conf
* [`splunkforwarder_props`](#splunkforwarder_props): Manage splunkforwarder props settings in props.conf
* [`splunkforwarder_server`](#splunkforwarder_server): Manage splunkforwarder server settings in server.conf
* [`splunkforwarder_transforms`](#splunkforwarder_transforms): Manage splunkforwarder transforms settings in transforms.conf
* [`splunkforwarder_web`](#splunkforwarder_web): Manage splunkforwarder web settings in web.conf

## Classes

### splunk

This class is unused and doesn't do anything but make default data
accessible

* **Note** If you were expecting this class to setup an instance of Splunk
Enterprise then please look to Class[splunk::enterprise].

### splunk::enterprise

Install and configure an instance of Splunk Enterprise

#### Examples

##### Basic usage

```puppet
include splunk::enterprise
```

##### Install specific version and build with admin passord management

```puppet
class { 'splunk::params':
  version => '7.2.5',
  build   => '088f49762779',
}
class { 'splunk::enterprise':
  package_ensure => latest,
  manage_password => true,
}
```

#### Parameters

The following parameters are available in the `splunk::enterprise` class.

##### `version`

Data type: `String[1]`

Specifies the version of Splunk Enterprise the module should install and
manage.

Default value: $splunk::params::version

##### `package_name`

Data type: `String[1]`

The name of the package(s) Puppet will use to install Splunk.

Default value: $splunk::params::enterprise_package_name

##### `package_ensure`

Data type: `String[1]`

Ensure parameter which will get passed to the Splunk package resource.

Default value: $splunk::params::enterprise_package_ensure

##### `staging_dir`

Data type: `String[1]`

Root of the archive path to host the Splunk package.

Default value: $splunk::params::staging_dir

##### `path_delimiter`

Data type: `String[1]`

The path separator used in the archived path of the Splunk package.

Default value: $splunk::params::path_delimiter

##### `enterprise_package_src`

Data type: `String[1]`

The source URL for the splunk installation media (typically an RPM, MSI,
etc). If a `$src_root` parameter is set in splunk::params, this will be
automatically supplied. Otherwise it is required. The URL can be of any
protocol supported by the pupept/archive module. On Windows, this can be
a UNC path to the MSI.

Default value: $splunk::params::enterprise_package_src

##### `package_provider`

Data type: `Optional[String[1]]`

The package management system used to host the Splunk packages.

Default value: $splunk::params::package_provider

##### `manage_package_source`

Data type: `Boolean`

Whether or not to use the supplied `enterprise_package_src` param.

Default value: `true`

##### `package_source`

Data type: `Optional[String[1]]`

*Optional* The source URL for the splunk installation media (typically an RPM,
MSI, etc). If `enterprise_package_src` parameter is set in splunk::params and
`manage_package_source` is true, this will be automatically supplied. Otherwise
it is required. The URL can be of any protocol supported by the puppet/archive
module. On Windows, this can be a UNC path to the MSI.

Default value: `undef`

##### `install_options`

Data type: `Splunk::Entinstalloptions`

This variable is passed to the package resources' *install_options* parameter.

Default value: $splunk::params::enterprise_install_options

##### `splunk_user`

Data type: `String[1]`

The user to run Splunk as.

Default value: $splunk::params::splunk_user

##### `enterprise_homedir`

Data type: `Stdlib::Absolutepath`

Specifies the Splunk Enterprise home directory.

Default value: $splunk::params::enterprise_homedir

##### `enterprise_confdir`

Data type: `Stdlib::Absolutepath`

Specifies the Splunk Enterprise configuration directory.

Default value: $splunk::params::enterprise_confdir

##### `service_name`

Data type: `String[1]`

The name of the Splunk Enterprise service.

Default value: $splunk::params::enterprise_service

##### `service_file`

Data type: `Stdlib::Absolutepath`

The path to the Splunk Enterprise service file.

Default value: $splunk::params::enterprise_service_file

##### `boot_start`

Data type: `Boolean`

Whether or not to enable splunk boot-start, which generates a service file to
manage the Splunk Enterprise service.

Default value: $splunk::params::boot_start

##### `use_default_config`

Data type: `Boolean`

Whether or not the module should manage a default set of Splunk Enterprise
configuration parameters.

Default value: `true`

##### `input_default_host`

Data type: `String[1]`

Part of the default config. Sets the `splunk_input` default host.

Default value: $facts['fqdn']

##### `input_connection_host`

Data type: `String[1]`

Part of the default config. Sets the `splunk_input` connection host.

Default value: 'dns'

##### `splunkd_listen`

Data type: `Stdlib::IP::Address`

The address on which splunkd should listen.

Default value: '127.0.0.1'

##### `logging_port`

Data type: `Stdlib::Port`

The port to receive TCP logs on.

Default value: $splunk::params::logging_port

##### `splunkd_port`

Data type: `Stdlib::Port`

The management port for Splunk.

Default value: $splunk::params::splunkd_port

##### `web_port`

The port on which to service the Splunk Web interface.

##### `purge_inputs`

Data type: `Boolean`

If set to true, inputs.conf will be purged of configuration that is
no longer managed by the `splunk_input` type.

Default value: `false`

##### `purge_outputs`

Data type: `Boolean`

If set to true, outputs.conf will be purged of configuration that is
no longer managed by the `splunk_output` type.

Default value: `false`

##### `purge_authentication`

Data type: `Boolean`

If set to true, authentication.conf will be purged of configuration
that is no longer managed by the `splunk_authentication` type.

Default value: `false`

##### `purge_authorize`

Data type: `Boolean`

If set to true, authorize.conf will be purged of configuration that
is no longer managed by the `splunk_authorize` type.

Default value: `false`

##### `purge_distsearch`

Data type: `Boolean`

If set to true, distsearch.conf will be purged of configuration that
is no longer managed by the `splunk_distsearch` type.

Default value: `false`

##### `purge_indexes`

Data type: `Boolean`

If set to true, indexes.conf will be purged of configuration that is
no longer managed by the `splunk_indexes` type.

Default value: `false`

##### `purge_limits`

Data type: `Boolean`

If set to true, limits.conf will be purged of configuration that is
no longer managed by the `splunk_limits` type.

Default value: `false`

##### `purge_props`

Data type: `Boolean`

If set to true, props.conf will be purged of configuration that is
no longer managed by the `splunk_props` type.

Default value: `false`

##### `purge_server`

Data type: `Boolean`

If set to true, server.conf will be purged of configuration that is
no longer managed by the `splunk_server` type.

Default value: `false`

##### `purge_transforms`

Data type: `Boolean`

If set to true, transforms.conf will be purged of configuration that
is no longer managed by the `splunk_transforms` type.

Default value: `false`

##### `purge_web`

Data type: `Boolean`

If set to true, web.conf will be purged of configuration that is no
longer managed by the `splunk_web type`.

Default value: `false`

##### `manage_password`

Data type: `Boolean`

If set to true, Manage the contents of splunk.secret and passwd.

Default value: $splunk::params::manage_password

##### `seed_password`

Data type: `Boolean`

If set to true, Manage the contents of splunk.secret and user-seed.conf.

Default value: $splunk::params::seed_password

##### `reset_seed_password`

If set to true, deletes `password_config_file` to trigger Splunk's password
import process on restart of the Splunk services.

##### `password_config_file`

Data type: `Stdlib::Absolutepath`

Which file to put the password in i.e. in linux it would be
`/opt/splunk/etc/passwd`.

Default value: $splunk::params::enterprise_password_config_file

##### `seed_config_file`

Data type: `Stdlib::Absolutepath`

Which file to place the admin password hash in so its imported by Splunk on
restart.

Default value: $splunk::params::enterprise_seed_config_file

##### `password_content`

Data type: `String[1]`

The hashed password username/details for the user.

Default value: $splunk::params::password_content

##### `password_hash`

Data type: `String[1]`

The hashed password for the admin user.

Default value: $splunk::params::password_hash

##### `secret_file`

Data type: `Stdlib::Absolutepath`

Which file we should put the secret in.

Default value: $splunk::params::enterprise_secret_file

##### `secret`

Data type: `String[1]`

The secret used to salt the splunk password.

Default value: $splunk::params::secret

##### `web_httpport`

Data type: `Stdlib::Port`



Default value: 8000

##### `purge_alert_actions`

Data type: `Boolean`



Default value: `false`

##### `purge_deploymentclient`

Data type: `Boolean`



Default value: `false`

##### `purge_serverclass`

Data type: `Boolean`



Default value: `false`

##### `purge_uiprefs`

Data type: `Boolean`



Default value: `false`

##### `reset_seeded_password`

Data type: `Boolean`



Default value: $splunk::params::reset_seeded_password

### splunk::enterprise::config

Private class declared by Class[splunk::enterprise] to contain all the
configuration needed for a base install of Splunk Enterprise

### splunk::enterprise::install

Private class declared by Class[splunk::enterprise] to contain or define
through additional platform specific sub-class, the required steps
for successfully installing Splunk Enterprise

### splunk::enterprise::install::nix

Private class declared by Class[splunk::enterprise::install] to provide
platform specific installation steps on Linux or Unix type systems.

### splunk::enterprise::password::manage

Implements the direct management of the Splunk Enterprise admin password
so it can be used outside of regular management of the whole stack to
facilitate admin password resets through Bolt Plans.

Note: Entirely done to make this implementation consistent with the method
used to manage admin password seeding.

#### Parameters

The following parameters are available in the `splunk::enterprise::password::manage` class.

##### `manage_password`

Data type: `Boolean`

If set to true, Manage the contents of splunk.secret and passwd.

Default value: $splunk::params::manage_password

##### `password_config_file`

Data type: `Stdlib::Absolutepath`

Which file to put the password in i.e. in linux it would be
`/opt/splunk/etc/passwd`.

Default value: $splunk::params::forwarder_password_config_file

##### `password_content`

Data type: `String[1]`

The hashed password username/details for the user.

Default value: $splunk::params::password_content

##### `secret_file`

Data type: `Stdlib::Absolutepath`

Which file we should put the secret in.

Default value: $splunk::params::forwarder_secret_file

##### `secret`

Data type: `String[1]`

The secret used to salt the splunk password.

Default value: $splunk::params::secret

##### `splunk_user`

Data type: `String[1]`



Default value: $splunk::params::splunk_user

##### `service`

Data type: `String[1]`



Default value: $splunk::params::enterprise_service

##### `mode`

Data type: `Enum['agent', 'bolt']`



Default value: 'bolt'

### splunk::enterprise::password::seed

Implements the seeding and reseeding of the Splunk Enterprise admin password
so it can be used outside of regular management of the whole stack to
facilitate admin password resets through Bolt Plans

#### Parameters

The following parameters are available in the `splunk::enterprise::password::seed` class.

##### `seed_password`

If set to true, Manage the contents of splunk.secret and user-seed.conf.

##### `reset_seed_password`

If set to true, deletes `password_config_file` to trigger Splunk's password
import process on restart of the Splunk services.

##### `password_config_file`

Data type: `Stdlib::Absolutepath`

Which file to put the password in i.e. in linux it would be
`/opt/splunk/etc/passwd`.

Default value: $splunk::params::enterprise_password_config_file

##### `seed_config_file`

Data type: `Stdlib::Absolutepath`

Which file to place the admin password hash in so its imported by Splunk on
restart.

Default value: $splunk::params::enterprise_seed_config_file

##### `password_hash`

Data type: `String[1]`

The hashed password for the admin user.

Default value: $splunk::params::password_hash

##### `secret_file`

Data type: `Stdlib::Absolutepath`

Which file we should put the secret in.

Default value: $splunk::params::enterprise_secret_file

##### `secret`

Data type: `String[1]`

The secret used to salt the splunk password.

Default value: $splunk::params::secret

##### `reset_seeded_password`

Data type: `Boolean`



Default value: $splunk::params::reset_seeded_password

##### `splunk_user`

Data type: `String[1]`



Default value: $splunk::params::splunk_user

##### `service`

Data type: `String[1]`



Default value: $splunk::params::enterprise_service

##### `mode`

Data type: `Enum['agent', 'bolt']`



Default value: 'bolt'

### splunk::enterprise::service

Private class declared by Class[splunk::enterprise] to define a service
as its understood by Puppet using a dynamic set of data or platform specific
sub-classes

### splunk::enterprise::service::nix

Private class declared by Class[splunk::enterprise::service] to provide
platform specific service management on Linux or Unix type systems.

### splunk::forwarder

Install and configure an instance of Splunk Universal Forwarder

#### Examples

##### Basic usage

```puppet
include splunk::forwarder
```

##### Install specific version and build with admin passord management

```puppet
class { 'splunk::params':
  version => '7.2.5',
  build   => '088f49762779',
}
class { 'splunk::forwarder':
  package_ensure => latest,
  manage_password => true,
}
```

#### Parameters

The following parameters are available in the `splunk::forwarder` class.

##### `server`

Data type: `String[1]`

The fqdn or IP address of the Splunk server.

Default value: $splunk::params::server

##### `version``

Specifies the version of Splunk Forwarder the module should install and
manage.

##### `package_name`

Data type: `String[1]`

The name of the package(s) Puppet will use to install Splunk Forwarder.

Default value: $splunk::params::forwarder_package_name

##### `package_ensure`

Data type: `String[1]`

Ensure parameter which will get passed to the Splunk package resource.

Default value: $splunk::params::forwarder_package_ensure

##### `staging_dir`

Data type: `String[1]`

Root of the archive path to host the Splunk package.

Default value: $splunk::params::staging_dir

##### `path_delimiter`

Data type: `String[1]`

The path separator used in the archived path of the Splunk package.

Default value: $splunk::params::path_delimiter

##### `forwarder_package_src`

Data type: `String[1]`

The source URL for the splunk installation media (typically an RPM, MSI,
etc). If a `$src_root` parameter is set in splunk::params, this will be
automatically supplied. Otherwise it is required. The URL can be of any
protocol supported by the puppet/archive module. On Windows, this can be
a UNC path to the MSI.

Default value: $splunk::params::forwarder_package_src

##### `package_provider`

Data type: `Optional[String[1]]`

The package management system used to host the Splunk packages.

Default value: $splunk::params::package_provider

##### `manage_package_source`

Data type: `Boolean`

Whether or not to use the supplied `forwarder_package_src` param.

Default value: `true`

##### `package_source`

Data type: `Optional[String[1]]`

*Optional* The source URL for the splunk installation media (typically an RPM,
MSI, etc). If `enterprise_package_src` parameter is set in splunk::params and
`manage_package_source` is true, this will be automatically supplied. Otherwise
it is required. The URL can be of any protocol supported by the puppet/archive
module. On Windows, this can be a UNC path to the MSI.

Default value: `undef`

##### `install_options`

Data type: `Splunk::Fwdinstalloptions`

This variable is passed to the package resources' *install_options* parameter.

Default value: $splunk::params::forwarder_install_options

##### `splunk_user`

Data type: `String[1]`

The user to run Splunk as.

Default value: $splunk::params::splunk_user

##### `forwarder_homedir`

Data type: `Stdlib::Absolutepath`

Specifies the Splunk Forwarder home directory.

Default value: $splunk::params::forwarder_homedir

##### `forwarder_confdir`

Data type: `Stdlib::Absolutepath`

Specifies the Splunk Forwarder configuration directory.

Default value: $splunk::params::forwarder_confdir

##### `service_name`

Data type: `String[1]`

The name of the Splunk Forwarder service.

Default value: $splunk::params::forwarder_service

##### `service_file`

Data type: `Stdlib::Absolutepath`

The path to the Splunk Forwarder service file.

Default value: $splunk::params::forwarder_service_file

##### `boot_start`

Data type: `Boolean`

Whether or not to enable splunk boot-start, which generates a service file to
manage the Splunk Forwarder service.

Default value: $splunk::params::boot_start

##### `use_default_config`

Data type: `Boolean`

Whether or not the module should manage a default set of Splunk Forwarder
configuration parameters.

Default value: `true`

##### `splunkd_listen`

Data type: `Stdlib::IP::Address`

The address on which splunkd should listen.

Default value: '127.0.0.1'

##### `splunkd_port`

Data type: `Stdlib::Port`

The management port for Splunk.

Default value: $splunk::params::splunkd_port

##### `logging_port`

Data type: `Stdlib::Port`

The port on which to send and listen for logs.

Default value: $splunk::params::logging_port

##### `purge_inputs`

Data type: `Boolean`

*Optional* If set to true, inputs.conf will be purged of configuration that is
no longer managed by the `splunkforwarder_input` type.

Default value: `false`

##### `purge_outputs`

Data type: `Boolean`

*Optional* If set to true, outputs.conf will be purged of configuration that is
no longer managed by the `splunk_output` type.

Default value: `false`

##### `purge_props`

Data type: `Boolean`

*Optional* If set to true, props.conf will be purged of configuration that is
no longer managed by the `splunk_props` type.

Default value: `false`

##### `purge_transforms`

Data type: `Boolean`

*Optional* If set to true, transforms.conf will be purged of configuration that is
no longer managed by the `splunk_transforms` type.

Default value: `false`

##### `purge_web`

Data type: `Boolean`

*Optional* If set to true, web.conf will be purged of configuration that is
no longer managed by the `splunk_web` type.

Default value: `false`

##### `forwarder_input`

Data type: `Hash`

Used to override the default `forwarder_input` type defined in splunk::params.

Default value: $splunk::params::forwarder_input

##### `forwarder_output`

Data type: `Hash`

Used to override the default `forwarder_output` type defined in splunk::params.

Default value: $splunk::params::forwarder_output

##### `manage_password`

Data type: `Boolean`

If set to true, Manage the contents of splunk.secret and passwd.

Default value: $splunk::params::manage_password

##### `seed_password`

Data type: `Boolean`

If set to true, Manage the contents of splunk.secret and user-seed.conf.

Default value: $splunk::params::seed_password

##### `reset_seed_password`

If set to true, deletes `password_config_file` to trigger Splunk's password
import process on restart of the Splunk services.

##### `password_config_file`

Data type: `Stdlib::Absolutepath`

Which file to put the password in i.e. in linux it would be
`/opt/splunkforwarder/etc/passwd`.

Default value: $splunk::params::forwarder_password_config_file

##### `seed_config_file`

Data type: `Stdlib::Absolutepath`

Which file to place the admin password hash in so its imported by Splunk on
restart.

Default value: $splunk::params::forwarder_seed_config_file

##### `password_content`

Data type: `String[1]`

The hashed password username/details for the user.

Default value: $splunk::params::password_content

##### `password_hash`

Data type: `String[1]`

The hashed password for the admin user.

Default value: $splunk::params::password_hash

##### `secret_file`

Data type: `Stdlib::Absolutepath`

Which file we should put the secret in.

Default value: $splunk::params::forwarder_secret_file

##### `secret`

Data type: `String[1]`

The secret used to salt the splunk password.

Default value: $splunk::params::secret

##### `addons`

Data type: `Hash`

Manage a splunk addons, see `splunk::addons`.

Default value: {}

##### `version`

Data type: `String[1]`



Default value: $splunk::params::version

##### `purge_deploymentclient`

Data type: `Boolean`



Default value: `false`

##### `reset_seeded_password`

Data type: `Boolean`



Default value: $splunk::params::reset_seeded_password

### splunk::forwarder::config

Private class declared by Class[splunk::forwarder] to contain all the
configuration needed for a base install of the Splunk Universal
Forwarder

### splunk::forwarder::install

Private class declared by Class[splunk::forwarder] to contain or define
through additional platform specific sub-class, the required steps
for successfully installing the Splunk Universal Forwarder

### splunk::forwarder::password::manage

Implements the direct management of the Splunk Forwarder admin password
so it can be used outside of regular management of the whole stack to
facilitate admin password resets through Bolt Plans.

Note: Entirely done to make this implementation consistent with the method
used to manage admin password seeding.

#### Parameters

The following parameters are available in the `splunk::forwarder::password::manage` class.

##### `manage_password`

Data type: `Boolean`

If set to true, Manage the contents of splunk.secret and passwd.

Default value: $splunk::params::manage_password

##### `password_config_file`

Data type: `Stdlib::Absolutepath`

Which file to put the password in i.e. in linux it would be
`/opt/splunkforwarder/etc/passwd`.

Default value: $splunk::params::enterprise_password_config_file

##### `password_content`

Data type: `String[1]`

The hashed password username/details for the user.

Default value: $splunk::params::password_content

##### `secret_file`

Data type: `Stdlib::Absolutepath`

Which file we should put the secret in.

Default value: $splunk::params::enterprise_secret_file

##### `secret`

Data type: `String[1]`

The secret used to salt the splunk password.

Default value: $splunk::params::secret

##### `splunk_user`

Data type: `String[1]`



Default value: $splunk::params::splunk_user

##### `service`

Data type: `String[1]`



Default value: $splunk::params::forwarder_service

##### `mode`

Data type: `Enum['agent', 'bolt']`



Default value: 'bolt'

### splunk::forwarder::password::seed

Implements the seeding and reseeding of the Splunk Forwarder admin password
so it can be used outside of regular management of the whole stack to
facilitate admin password resets through Bolt Plans

#### Parameters

The following parameters are available in the `splunk::forwarder::password::seed` class.

##### `seed_password`

If set to true, Manage the contents of splunk.secret and user-seed.conf.

##### `reset_seed_password`

If set to true, deletes `password_config_file` to trigger Splunk's password
import process on restart of the Splunk services.

##### `password_config_file`

Data type: `Stdlib::Absolutepath`

Which file to put the password in i.e. in linux it would be
`/opt/splunkforwarder/etc/passwd`.

Default value: $splunk::params::forwarder_password_config_file

##### `seed_config_file`

Data type: `Stdlib::Absolutepath`

Which file to place the admin password hash in so its imported by Splunk on
restart.

Default value: $splunk::params::forwarder_seed_config_file

##### `password_hash`

Data type: `String[1]`

The hashed password for the admin user.

Default value: $splunk::params::password_hash

##### `secret_file`

Data type: `Stdlib::Absolutepath`

Which file we should put the secret in.

Default value: $splunk::params::forwarder_secret_file

##### `secret`

Data type: `String[1]`

The secret used to salt the splunk password.

Default value: $splunk::params::secret

##### `reset_seeded_password`

Data type: `Boolean`



Default value: $splunk::params::reset_seeded_password

##### `splunk_user`

Data type: `String[1]`



Default value: $splunk::params::splunk_user

##### `service`

Data type: `String[1]`



Default value: $splunk::params::forwarder_service

##### `mode`

Data type: `Enum['agent', 'bolt']`



Default value: 'bolt'

### splunk::forwarder::service

Private class declared by Class[splunk::forwarder] to define a service as
its understood by Puppet using a dynamic set of data or platform specific
sub-classes

### splunk::forwarder::service::nix

Private class declared by Class[splunk::forwarder::service] to provide
platform specific service management on Linux or Unix type systems.

### splunk::params

This class takes a small number of arguments (can be set through Hiera) and
generates sane default values installation media names and locations.
Default ports can also be specified here. This is a parameters class, and
contributes no resources to the graph. Rather, it only sets values for
parameters to be consumed by child classes.

#### Parameters

The following parameters are available in the `splunk::params` class.

##### `version`

Data type: `String[1]`

The version of Splunk to install. This will be in the form x.y.z; e.g.
"4.3.2".

Default value: '7.2.4.2'

##### `build`

Data type: `String[1]`

Splunk packages are typically named based on the platform, architecture,
version, and build. Puppet can determine the platform information
automatically but a build number must be supplied in order to correctly
construct the path to the packages. A build number will be six digits;
e.g. "123586".

Default value: 'fb30470262e3'

##### `splunkd_port`

Data type: `Stdlib::Port`

The splunkd port.

Default value: 8089

##### `logging_port`

Data type: `Stdlib::Port`

The port on which to send logs, and listen for logs.

Default value: 9997

##### `server`

Data type: `String[1]`

Optional fqdn or IP of the Splunk Enterprise server.  Used for setting up
the default TCP output and input.

Default value: 'splunk'

##### `splunk_user`

Data type: `String[1]`

The user that splunk runs as.

Default value: $facts['os']['family']

##### `src_root`

Data type: `String[1]`

The root URL at which to find the splunk packages. The sane-default logic
assumes that the packages are located under this URL in the same way that
they are placed on download.splunk.com. The URL can be any protocol that
the puppet/archive module supports. This includes both puppet:// and
http://.

The expected directory structure is:

```
$root_url/
└── products/
    ├── universalforwarder/
    │   └── releases/
    |       └── $version/
    |           └── $platform/
    |               └── splunkforwarder-${version}-${build}-${additl}
    └── splunk/
        └── releases/
            └── $version/
                └── $platform/
                    └── splunk-${version}-${build}-${additl}
```

A semi-populated example of `src_root` contains:

```
$root_url/
└── products/
    ├── universalforwarder/
    │   └── releases/
    |       └── 7.2.4.2/
    |           ├── linux/
    |           |   ├── splunkforwarder-7.2.4.2-fb30470262e3-linux-2.6-amd64.deb
    |           |   ├── splunkforwarder-7.2.4.2-fb30470262e3-linux-2.6-intel.deb
    |           |   └── splunkforwarder-7.2.4.2-fb30470262e3-linux-2.6-x86_64.rpm
    |           ├── solaris/
    |           └── windows/
    |               └── splunkforwarder-7.2.4.2-fb30470262e3-x64-release.msi
    └── splunk/
        └── releases/
            └── 7.2.4.2/
                └── linux/
                    ├── splunk-7.2.4.2-fb30470262e3-linux-2.6-amd64.deb
                    ├── splunk-7.2.4.2-fb30470262e3-linux-2.6-intel.deb
                    └── splunk-7.2.4.2-fb30470262e3-linux-2.6-x86_64.rpm
```

Default value: 'https://download.splunk.com'

##### `boot_start`

Data type: `Boolean`

Enable Splunk to start at boot, create a system service file.

WARNING: Toggling `boot_start` from `false` to `true` will cause a restart of
Splunk Enterprise and Forwarder services.

Default value: `true`

##### `forwarder_installdir`

Data type: `Optional[String[1]]`

Optional directory in which to install and manage Splunk Forwarder

Default value: `undef`

##### `enterprise_installdir`

Data type: `Optional[String[1]]`

Optional directory in which to install and manage Splunk Enterprise

Default value: `undef`

## Defined types

### splunk::addon

Defined type for deploying Splunk Add-ons and Apps from either OS packages
or via splunkbase compatible archives

* **See also**
https://docs.splunk.com/Documentation/AddOns/released/Overview/AboutSplunkadd-ons

#### Examples

##### Basic usage

```puppet
splunk::addon { 'Splunk_TA_nix':
  splunkbase_source => 'puppet:///modules/splunk_qd/addons/splunk-add-on-for-unix-and-linux_602.tgz',
  inputs            => {
    'monitor:///var/log'       => {
     'whitelist' => '(\.log|log$|messages|secure|auth|mesg$|cron$|acpid$|\.out)',
     'blacklist' => '(lastlog|anaconda\.syslog)',
     'disabled'  => 'false'
    },
    'script://./bin/uptime.sh' =>  {
      'disabled' => 'false',
      'interval' => '86400',
      'source' => 'Unix:Uptime',
      'sourcetype' => 'Unix:Uptime'
    }
  }
}
```

#### Parameters

The following parameters are available in the `splunk::addon` defined type.

##### `splunk_home`

Data type: `Optional[Stdlib::Absolutepath]`

Overrides the default Splunk installation target values from Class[splunk::params]

Default value: `undef`

##### `package_manage`

Data type: `Boolean`

If a package should be installed as part of declaring a new instance of Splunk::Addon

Default value: `true`

##### `splunkbase_source`

Data type: `Optional[String[1]]`

When set the add-on will be installed from a splunkbase compatible archive instead of OS packages

Default value: `undef`

##### `package_name`

Data type: `Optional[String[1]]`

The OS package to install if you are not installing via splunk compatible archive

Default value: `undef`

##### `owner`

Data type: `String[1]`

The user that files are owned by when they are created as part of add-on installation

Default value: 'splunk'

##### `inputs`

Data type: `Hash`

A hash of inputs to be configured as part of add-on installation, alterntively you can also define splunk_input or splunkforwarder_input resouces seperately

Default value: {}

## Resource types

### splunk_alert_actions

Manage splunk alert_actions settings in alert_actions.conf

### splunk_authentication

Manage splunk authentication settings in authentication.conf

### splunk_authorize

Manage splunk authorize settings in authorize.conf

### splunk_config

splunk config

#### Parameters

The following parameters are available in the `splunk_config` type.

##### `name`

namevar

splunk config

##### `forwarder_installdir`



##### `forwarder_confdir`



##### `server_installdir`



##### `server_confdir`



### splunk_deploymentclient

Manage splunk deploymentclient entries in deploymentclient.conf

### splunk_distsearch

Manage distsearch entries in distsearch.conf

### splunk_indexes

Manage splunk index settings in indexes.conf

### splunk_input

Manage splunk input settings in inputs.conf

### splunk_limits

Manage splunk limits settings in limits.conf

### splunk_metadata

Manage metadata entries in {default,local}.meta

### splunk_output

Manage splunk output settings in outputs.conf

### splunk_props

Manage splunk prop settings in props.conf

### splunk_server

Manage splunk server settings in server.conf

### splunk_serverclass

Manage splunk serverclass entries in serverclass.conf

### splunk_transforms

Manage splunk transforms settings in transforms.conf

### splunk_uiprefs

Manage splunk web ui settings in ui-prefs.conf

### splunk_web

Manage splunk web settings in web.conf

### splunkforwarder_deploymentclient

Manage splunkforwarder deploymentclient entries in deploymentclient.conf

### splunkforwarder_input

Manage splunkforwarder input settings in inputs.conf

### splunkforwarder_limits

Manage splunkforwarder limit settings in limits.conf

### splunkforwarder_output

Manage splunkforwarder output settings in outputs.conf

### splunkforwarder_props

Manage splunkforwarder props settings in props.conf

### splunkforwarder_server

Manage splunkforwarder server settings in server.conf

### splunkforwarder_transforms

Manage splunkforwarder transforms settings in transforms.conf

### splunkforwarder_web

Manage splunkforwarder web settings in web.conf
