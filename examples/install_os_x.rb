imagr_workflow 'Install OS X' do
  description 'COSXIP example workflow to installs OS X on the target volume.'
end

components_for_workflow 'Install OS X' do
  package 'http://192.168.178.135/COSXIP-10.11.3.dmg'
  bless_target false
  first_boot_reboot false
  restart_action 'restart'
end
