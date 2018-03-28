require 'spec_helper'

describe 'splunk' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      package_name = 'splunk'
      service_name = 'splunk'
      if /^windows-/ =~ os then
        package_name = 'Splunk'
	service_name = 'Splunkd'
      end

      context "on #{os}" do
        let(:facts) do
          facts
        end

        context 'splunk class without any parameters' do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('splunk::params') }

          it { is_expected.to contain_service(service_name) }
          it { is_expected.to contain_package(package_name).with_ensure('installed') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'splunk class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          osfamily:        'Solaris',
          operatingsystem: 'Nexenta',
          kernel:          'SunOS',
          architecture:    'sparc'
        }
      end

      it { expect { is_expected.to contain_package('splunk') }.to raise_error(Puppet::Error, %r{unsupported osfamily/arch Solaris/sparc}) }
    end
  end
end
