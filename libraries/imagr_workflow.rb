module ImagrCookbook
  class ImagrWorkflow < Chef::Resource
    require 'plist'

    attr_accessor :imagr_config

    def initialize
      @imagr_config = {}
    end

    resource_name :imagr_workflow

    default_action :create

    property :name, String, name_property: true, required: true
    property :description, String, default: ''

    # Properties for an imagr workflow represent the workflow level configuration settings:
    property :restart_action, [NilClass, String], default: nil
    property :first_boot_reboot, [TrueClass, FalseClass], default: true
    property :hidden, [TrueClass, FalseClass], default: false
    property :bless_target, [TrueClass, FalseClass], default: true

    action :create do
      @imagr_config = {
        'name' => new_resource.name,
        'description' => new_resource.description,
        'restart_action' => new_resource.restart_action,
        'first_boot_reboot' => new_resource.first_boot_reboot,
        'hidden' => new_resource.hidden,
        'bless_target' => new_resource.bless_target,
      }
      plist = Plist::Emit.dump(ImagrWorkflow.imagr_config)

      file "#{ENV['HOME']}/imagr_config.plist" do
        content plist
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
