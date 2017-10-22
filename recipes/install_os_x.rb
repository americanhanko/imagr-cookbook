imagr_workflow 'Install OS X' do
  description 'COSXIP example workflow to installs OS X on the target volume.'
  bless_target false
  first_boot_reboot false
  restart_action 'restart'
end

imagr_component 'package' do
  url 'http://192.168.178.135/COSXIP-10.11.3.dmg'
  parent_workflow 'Install OS X'
end
