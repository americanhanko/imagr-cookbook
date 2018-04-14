template node['imagr']['app']['plist'] do
  source 'com.grahamgilbert.Imagr.erb'
end

dmg_package 'Imagr' do
  source node['imagr']['app']['source']
end

launchd 'com.grahamgilbert.Imagr' do
  program '/Applications/Imagr.app/Contents/MacOS/Imagr'
  type 'agent'
  run_at_load true
  action :enable
end
