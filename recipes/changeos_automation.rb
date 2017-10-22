imagr_workflow 'AutoInfra ChangeOS (Yosemite)' do
  description 'Deploys ChangeOS 10.10 and runs changeos_setup.command'
  restart_action 'restart'
end

imagr_component 'included_workflow' do
  workflow_name 'disable_sip'
  parent_workflow 'AutoInfra ChangeOS (Yosemite)'
end

imagr_component 'partition' do
  map 'GPTFormat'
  partitions [{ format_type: 'Journaled HFS+', name: 'ChangeOS', size: '100%', target: true }]
  parent_workflow 'AutoInfra ChangeOS (Yosemite)'
end

imagr_component 'image' do
  url 'http://autoimagr/auto/10.10/10.10.4_ChangeOS_2015.07.21.dmg'
  parent_workflow 'AutoInfra ChangeOS (Yosemite)'
end

imagr_component 'computer_name' do
  parent_workflow 'AutoInfra ChangeOS (Yosemite)'
end

imagr_component 'script' do
  url 'http://autoimagr/scripts/run_changeos_setup.sh'
  parent_workflow 'AutoInfra ChangeOS (Yosemite)'
end
