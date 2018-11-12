resource_name :imagr_component

available_types = %w(
  computer_name
  erase_volume
  image
  localization
  package
  partition
  script_inline
  script_url
  included_workflow
)

property :parent_workflow, String, required: true
property :type, String, name_property: true, required: true, equal_to: available_types

property :additional_headers, Array, default: [], desired_state: false
property :auto, [true, false], default: false, desired_state: false
property :content, String, default: '', desired_state: false
property :first_boot, [true, false], default: false, desired_state: false
property :format, String, default: '', desired_state: false
property :keyboard_layout_id, String, default: '', desired_state: false
property :keyboard_layout_name, String, default: '', desired_state: false
property :language, String, default: '', desired_state: false
property :locale, String, default: '', desired_state: false
property :map, String, default: '', desired_state: false
property :name, String, default: '', desired_state: false
property :partitions, Array, default: [], desired_state: false
property :script, String, default: '', desired_state: false
property :timezone, String, default: '', desired_state: false
property :url, String, default: '', desired_state: false
property :use_serial, [true, false], default: false, desired_state: false
property :verify, [true, false], default: true, desired_state: false
property :workflow_name, String, default: '', desired_state: false

# {{target_volume}} - used to refer to the target volume
# {{serial_number}} - access to the machine's serial number
# {{machine_model}} - access to the machine's model

default_action :create

action_class do
  def options
    {
      package:           {
        url: new_resource.url,
        first_boot: new_resource.first_boot,
        additional_headers: new_resource.additional_headers,
      },
      included_workflow: {
        workflow_name: new_resource.workflow_name,
        script: new_resource.script,
      },
      image:             {
        url: new_resource.url,
        verify: new_resource.verify,
      },
      computer_name:     {
        use_serial: new_resource.use_serial,
        auto: new_resource.auto,
      },
      localization:      {
        keyboard_layout_id: new_resource.keyboard_layout_id,
        keyboard_layout_name: new_resource.keyboard_layout_name,
      },
      script_inline:     {
        content: new_resource.content,
        first_boot: new_resource.first_boot,
      },
      script_url:        {
        url: new_resource.url,
        additional_headers: new_resource.additional_headers,
      },
      erase_volume:      {
        name: new_resource.name,
        format: new_resource.format,
      },
      partition:         {
        map: new_resource.map,
        partitions: new_resource.partitions,
      },
    }
  end
end

action :create do
  node.default['imagr']['plist']['workflows'].each do |workflow|
    if workflow[:name] == new_resource.parent_workflow
      workflow[:components] << options[new_resource.type.to_sym]
    end
  end

  file node.default['imagr']['config']['path'] do
    content node.default['imagr']['plist'].to_plist
  end
end
