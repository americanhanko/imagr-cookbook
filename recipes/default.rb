# imagr_workflow 'AutoInfra ChangeOS (Yosemite)' do
#   description 'Deploys ChangeOS 10.10 and runs changeos_setup.'
#   restart_action 'shutdown'
# end

imagr_component 'included_workflow' do
  workflow 'disable_sip'
end
