template node['imagr']['app']['plist'] do
  source 'com.grahamgilbert.Imagr.erb'
end

dmg_package 'Imagr' do
  source 'https://github.com/grahamgilbert/imagr/releases/download/1.4.1/Imagr-1.4.1.dmg'
end
