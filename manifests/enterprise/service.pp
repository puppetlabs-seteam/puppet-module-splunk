# @summary
#   Private class declared by Class[splunk::enterprise] to define a service
#   as its understood by Puppet using a dynamic set of data or platform specific
#   sub-classes
#
class splunk::enterprise::service {
  assert_private()

  # This is a module that supports multiple platforms. For some platforms
  # there is non-generic configuration that needs to be declared in addition
  # to the agnostic resources declared here.
  if $facts['kernel'] in ['Linux','SunOS'] {
    include splunk::enterprise::service::nix
  }

  service { $splunk::enterprise::_service_name:
    ensure     => $splunk::enterprise::service_ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}
