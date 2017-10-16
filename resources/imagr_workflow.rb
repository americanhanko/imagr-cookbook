resource_name :imagr_workflow

property :name, String, name_property: true, required: true
property :description, String, default: ''

# Properties for an imagr workflow represent the workflow level configuration settings:
property :restart_action, [NilClass, String], default: nil
property :first_boot_reboot, [TrueClass, FalseClass], default: true
property :hidden, [TrueClass, FalseClass], default: false
property :bless_target, [TrueClass, FalseClass], default: true

action :initialize do
  ImagrWorkspace.new
end

# %w(foo bar).each_with_object({}) do |key, value|
#   plist[key] = value if value
# end

# pry(main)> imagr_config['workflows'].first.keys
# ==> ["name", "description", "components", "restart_action", "bless_target"]

# pry(main)> sip['workflows'].first['components']
# => [{"type"=>"included_workflow", "name"=>"disableSIP"},
#  {"type"=>"included_workflow", "name"=>"bootMacOSX"}]
# pry(main)>

# new_resource.send(key) if new_resource.send(key)
