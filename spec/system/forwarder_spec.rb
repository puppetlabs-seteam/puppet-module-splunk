require 'spec_helper_system'
require 'pry'

describe 'setting up the forwarder' do
  it 'is able to set up a forwarder' do
    pp = <<-EOS
      class { 'splunk::params':
        version => '6.0',
        build   => '182037',
      }
      class { 'splunk::forwarder': }
    EOS

    # Run it twice and test for idempotency
    puppet_apply(pp) do |r|
      r.exit_code.should_not eq(1)
      r.refresh
      r.exit_code.should be_zero
    end
  end

  describe service('splunk') do
    it { is_expected.to be_running }
  end

  it 'changes the transforms settings for the forwarder' do
    pp = <<-EOS
      splunkforwarder_transforms { 'hadoop severity regex':
        section => 'hadoop_severity',
        setting => 'REGEX',
        value   => '\\d',
      }
      splunkforwarder_transforms { 'hadoop severity format':
        section => 'hadoop_severity',
        setting => 'FORMAT',
        value   => 'severity::$1',
      }
    EOS

    # Run it twice and test for idempotency
    puppet_apply(pp) do |r|
      r.exit_code.should_not eq(1)
      r.refresh
      r.exit_code.should be_zero
    end
  end

  describe file('/opt/splunkforwarder/etc/system/local/transforms.conf') do
    its(:content) { is_expected.to match(%r{\[hadoop_severity\]\nREGEX=\\d\nFORMAT=severity}) }
  end
end
