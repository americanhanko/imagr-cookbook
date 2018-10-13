resource_name :imagr_workflow

default_action :create

property :description, String, default: '', desired_state: false
property :name, String, name_property: true, required: true, desired_state: false

# Properties for an imagr workflow represent the workflow level configuration settings:
property :bless_target, [true, false], default: true, desired_state: false
property :first_boot_reboot, [true, false], default: true, desired_state: false
property :hidden, [true, false], default: false, desired_state: false
property :restart_action, [nil, String], default: '', desired_state: false

action_class do
  def add_to_plist
    {
      bless_target:      new_resource.bless_target,
      components:        [],
      description:       new_resource.description,
      first_boot_reboot: new_resource.first_boot_reboot,
      hidden:            new_resource.hidden,
      name:              new_resource.name,
      restart_action:    new_resource.restart_action,
    }
  end
end

action :create do
  node.default['imagr']['plist']['workflows'] << add_to_plist

  file node.default['imagr']['config']['path'] do
    content node.default['imagr']['plist'].to_plist
  end
end
