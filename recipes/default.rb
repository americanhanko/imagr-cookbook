template node['imagr']['app']['plist'] do
  source 'com.grahamgilbert.Imagr.erb'
end

if node['chef_packages']['chef']['version'] >= 14
  dmg_package 'Imagr' do
    source node['imagr']['app']['source']
  end
end
