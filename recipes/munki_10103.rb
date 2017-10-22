imagr_workflow 'Munki_10103' do
  description 'Deploys a 10.10.3 image with Munki Tools and its configuration.'
end

imagr_component 'image' do
  url 'http://192.168.178.135/osx_custom_150410-10.10.3-14D131.hfs.dmg'
  parent_workflow 'Munki_10103'
end

imagr_component 'package' do
  url 'http://192.168.178.135/MunkiTools.pkg'
  parent_workflow 'Munki_10103'
end

imagr_component 'package' do
  url 'http://192.168.178.135/Munki_Config.pkg'
  parent_workflow 'Munki_10103'
end

imagr_component 'package' do
  url 'http://192.168.178.135/clearReg.pkg'
  parent_workflow 'Munki_10103'
end

imagr_component 'script' do
  content <<-EOF
  #!/bin/bash
  echo "&lt;"
  echo "{{target_volume}}"
  /usr/bin/touch "{{target_volume}}/some_file"
  EOF
  parent_workflow 'Munki_10103'
end
