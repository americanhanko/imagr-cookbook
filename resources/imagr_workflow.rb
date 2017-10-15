resource_name :imagr_workflow

property :name, String, name_property: true
property :restart_action, [NilClass, String], default: nil
property :first_boot_reboot, [TrueClass, FalseClass], default: true
property :hidden, [TrueClass, FalseClass], default: false
property :bless_target, [TrueClass, FalseClass], default: true

action :bind do
  plist_structure = {}
  plist_structure
end
