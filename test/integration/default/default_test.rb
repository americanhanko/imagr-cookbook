describe file('/Library/Preferences/com.grahamgilbert.Imagr.plist') do
  it { should exist }
  its('content') { should match %r{http(|s):\/\/\S+\/\S+.plist} }
end

describe directory('/Applications/Imagr.app') do
  it { should exist }
end

describe launchd_service('com.grahamgilbert.Imagr') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
