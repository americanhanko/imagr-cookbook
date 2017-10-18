resource_name :imagr_workflow

default_action :create

property :name, String, name_property: true, required: true, desired_state: false
property :description, String, default: '', desired_state: false
property :path, String, default: "#{ENV['HOME']}/imagr_config.plist", desired_state: false

# Properties for an imagr workflow represent the workflow level configuration settings:
property :restart_action, [NilClass, String], default: nil, desired_state: false
property :first_boot_reboot, [TrueClass, FalseClass], default: true, desired_state: false
property :hidden, [TrueClass, FalseClass], default: false, desired_state: false
property :bless_target, [TrueClass, FalseClass], default: true, desired_state: false

action_class do
  include ImagrCookbook::Helpers

  def add_to_plist
    { name:              new_resource.name,
      description:       new_resource.description,
      restart_action:    new_resource.restart_action,
      first_boot_reboot: new_resource.first_boot_reboot,
      hidden:            new_resource.hidden,
      bless_target:      new_resource.bless_target,
      components:        [] }
  end
end

load_current_value do |desired|
  unfold_assistant('desired.name', desired.name, '=')
end

action :create do
  unfold_assistant('new_resource.class', new_resource.class, '+')
  unfold_assistant('current_resource.class', current_resource.class, '+')
  unfold_assistant('new_resource.class.class', new_resource.class.class, '+')
  unfold_assistant('new_resource.resource_name', new_resource.resource_name, '+')
  unfold_assistant('new_resource.methods', new_resource.methods, '+')
  unfold_assistant('new_resource.pretty_inspect', new_resource.pretty_inspect, '+')
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
