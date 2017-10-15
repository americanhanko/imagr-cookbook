resource_name :imagr_workflow

property :name, String, name_property: true, required: true
property :description, String, default: ''
property :restart_action, [NilClass, String], default: nil
property :first_boot_reboot, [TrueClass, FalseClass], default: true
property :hidden, [TrueClass, FalseClass], default: false
property :bless_target, [TrueClass, FalseClass], default: true

action :initialize do
  plist = {}
  plist['name'] = new_resource.name
  plist['description'] = new_resource.description
  plist['restart_action'] = new_resource.restart_action
  plist['first_boot_reboot'] = new_resource.first_boot_reboot
  plist['hidden'] = new_resource.hidden
  plist['bless_target'] = new_resource.bless_target
  plist.to_plist
  f = File.out('imagr_config.plist', 'w')
  f.write(plist)
end
