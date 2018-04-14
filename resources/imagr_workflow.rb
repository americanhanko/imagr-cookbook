resource_name :imagr_workflow

default_action :create

property :name, String, name_property: true, required: true, desired_state: false
property :description, String, default: '', desired_state: false

# Properties for an imagr workflow represent the workflow level configuration settings:
property :restart_action, [NilClass, String], default: '', desired_state: false
property :first_boot_reboot, [TrueClass, FalseClass], default: true, desired_state: false
property :hidden, [TrueClass, FalseClass], default: false, desired_state: false
property :bless_target, [TrueClass, FalseClass], default: true, desired_state: false

action_class do
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

action :create do
  require 'plist'
  node.default['imagr']['plist']['workflows'] << add_to_plist

  file node.default['imagr']['config']['path'] do
    content Plist::Emit.dump(node.default['imagr']['plist'])
  end
end