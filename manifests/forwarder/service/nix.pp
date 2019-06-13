# Class splunk::forwarder::service::nix
#
class splunk::forwarder::service::nix inherits splunk::forwarder::service {

  if $splunk::forwarder::boot_start {
    # Ensure splunk services *not* managed by the system service file are
    # gracefully shut down prior to enabling boot-start. Should the service
    # file be enabled while binary-managed splunk services are running, you
    # will no longer be able to control the binary-managed services
    # (start/stop/restart).
    exec { 'stop_splunkforwarder':
      command => "${splunk::forwarder::forwarder_homedir}/bin/splunk stop",
      user    => $splunk::forwarder::splunk_user,
      creates => $splunk::forwarder::forwarder_service_file,
      timeout => 0,
      notify  => Exec['enable_splunkforwarder'],
    }
    # This will fail if the unit file already exists.  Splunk does not remove
    # unit files during uninstallation, so you may be required to manually
    # remove existing unit files before re-installing and enabling boot-start.
    exec { 'enable_splunkforwarder':
      command     => "${splunk::forwarder::forwarder_homedir}/bin/splunk enable boot-start -user ${splunk::forwarder::splunk_user} --accept-license --answer-yes --no-prompt",
      tag         => 'splunk_forwarder',
      refreshonly => true,
      before      => [
        Package[$splunk::forwarder::package_name],
        Service[$splunk::forwarder::service_name]
      ],
      require     => Exec['stop_splunkforwarder'],
    }
  }
  # Commands to license and disable the SplunkUniversalForwarder
  #
  else {
    # Accept the license when disabling splunk in case system service files are
    # present before installing splunk.  The splunk package does not remove the
    # service files when uninstalled.
    exec { 'disable_splunkforwarder':
      command => "${splunk::forwarder::forwarder_homedir}/bin/splunk disable boot-start -user ${splunk::forwarder::splunk_user} --accept-license --answer-yes --no-prompt",
      onlyif  => "/usr/bin/test -f ${splunk::forwarder::forwarder_service_file}",
    }
    exec { 'license_splunkforwarder':
      command => "${splunk::forwarder::forwarder_homedir}/bin/splunk ftr --accept-license --answer-yes --no-prompt",
      user    => $splunk::forwarder::splunk_user,
      onlyif  => "/usr/bin/test -f ${splunk::forwarder::forwarder_homedir}/ftr",
      timeout => 0,
      before  => Service[$splunk::forwarder::service_name],
      require => Exec['disable_splunkforwarder'],
    }

    if $facts['kernel'] == 'Linux' {
      Service[$splunk::forwarder::service_name] {
        provider => 'base',
      }
    }
    else {
      Service[$splunk::forwarder::service_name] {
        provider => 'init',
      }
    }

    Service[$splunk::forwarder::service_name] {
      restart  => "/usr/sbin/runuser -l ${splunk::forwarder::splunk_user} -c '${splunk::forwarder::forwarder_homedir}/bin/splunk restart'",
      start    => "/usr/sbin/runuser -l ${splunk::forwarder::splunk_user} -c '${splunk::forwarder::forwarder_homedir}/bin/splunk start'",
      stop     => "/usr/sbin/runuser -l ${splunk::forwarder::splunk_user} -c '${splunk::forwarder::forwarder_homedir}/bin/splunk stop'",
      status   => "/usr/sbin/runuser -l ${splunk::forwarder::splunk_user} -c '${splunk::forwarder::forwarder_homedir}/bin/splunk status'",
      pattern  => "splunkd -p ${splunk::forwarder::splunkd_port} (restart|start)",
    }
  }

}
