template node['imagr']['app']['plist'] do
  source 'com.grahamgilbert.Imagr.erb'
end

dmg_package 'Imagr' do
  source node['imagr']['app']['source']
end

launchd 'com.grahamgilbert.Imagr' do
  program '/Applications/Imagr.app/Contents/MacOS/Imagr'
  launch_only_once true
  action :enable
end
