module ImagrCookbook
  class ImagrWorkflow < Chef::Resource
    require 'plist'

    imagr_config = {}

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

    action :create do
      imagr_config['workflows'] = { name:              new_resource.name,
                                    description:       new_resource.description,
                                    restart_action:    new_resource.restart_action,
                                    first_boot_reboot: new_resource.first_boot_reboot,
                                    hidden:            new_resource.hidden,
                                    bless_target:      new_resource.bless_target }

      plist = Plist::Emit.dump(imagr_config)

      file new_resource.path do
        content plist
        mode '0755'
        owner ENV['SUDO_USER']
        group ENV['SUDO_USER']
      end
    end
  end
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
