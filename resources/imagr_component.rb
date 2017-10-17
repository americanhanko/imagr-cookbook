resource_name :imagr_component

available_types = %w(included_workflow
                     image
                     package
                     computer_name
                     localization
                     script
                     partition
                     erase_volume)

property :type, available_types, name_property: true
property :workflow, String, required: true

# Component Types

## included_workflow
property :workflow_name, String
property :script, String

## image
property :url, String
property :verify, [TrueClass, FalseClass]

## package
property :url, String
property :first_boot, [TrueClass, FalseClass]
property :additional_headers, Array

## computer_name
property :use_serial, [TrueClass, FalseClass]
property :auto, [TrueClass, FalseClass]

## localization
property :keyboard_layout_name, String
property :keyboard_layout_id, String
property :language, String
property :locale, String
property :timezone, String

## script: method 1
property :content, String
property :first_boot, [TrueClass, FalseClass]

# {{target_volume}} - used to refer to the target volume
# {{serial_number}} - access to the machine's serial number
# {{machine_model}} - access to the machine's model

## script: method 2
property :url, String
property :additional_headers, Array

## partition
property :map, String
property :partitions, Array

## erase_volume
property :name, String
property :format, String

default_action :create

action_class do
  def options
    {
        package:           {
            url:    new_resource.url,
            verify: new_resource.verify },
        included_workflow: {
            workflow_name:   new_resource.workflow_name,
            script: new_resource.script },
        image:             {
            url:                new_resource.url,
            first_boot:         new_resource.first_boot,
            additional_headers: new_resource.additional_headers },
        computer_name:     {
            use_serial: new_resource.use_serial,
            auto:       new_resource.auto },
        localization:      {
            keyboard_layout_id:   new_resource.keyboard_layout_id,
            keyboard_layout_name: new_resource.keyboard_layout_name },
        script_inline:     {
            content:    new_resource.content,
            first_boot: new_resource.first_boot },
        script_url:        {
            url:                new_resource.url,
            additional_headers: new_resource.additional_headers },
        erase_volume:      {
            name:   new_resource.name,
            format: new_resource.format },
        partition:         {
            map:        new_resource.map,
            partitions: new_resource.partitions },
    }
  end
end

action :create do
  puts options[new_resource.type.to_sym]
end
