template node['imagr']['app']['plist'] do
  source 'com.grahamgilbert.Imagr.erb'
end

dmg_package 'Imagr' do
  source node['imagr']['app']['source']
end
