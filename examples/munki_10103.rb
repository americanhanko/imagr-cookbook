imagr_workflow 'Munki_10103' do
  description 'Deploys a 10.10.3 image with Munki Tools and its configuration.'
end

components_for_workflow 'Munki_10103' do
  image 'http://192.168.178.135/osx_custom_150410-10.10.3-14D131.hfs.dmg'
  packages ['http://192.168.178.135/MunkiTools.pkg', 'http://192.168.178.135/Munki_Config.pkg', 'http://192.168.178.135/clearReg.pkg']
  scripts 'touch_some_file.sh'
end
