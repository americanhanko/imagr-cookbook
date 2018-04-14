describe file('/Library/Preferences/com.grahamgilbert.Imagr.plist') do
  it { should exist }
  its('content') { should match %r{ http(|s):\/\/\S+\/\S+.plist } }
end
