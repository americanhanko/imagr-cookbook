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
property :workflow_name, String, desired_state: false
property :script, String, desired_state: false

## image
property :url, String, desired_state: false
property :verify, [TrueClass, FalseClass], desired_state: false

## package
property :first_boot, [TrueClass, FalseClass], desired_state: false
property :additional_headers, Array, desired_state: false

## computer_name
property :use_serial, [TrueClass, FalseClass], desired_state: false
property :auto, [TrueClass, FalseClass], desired_state: false

## localization
property :keyboard_layout_name, String, desired_state: false
property :keyboard_layout_id, String, desired_state: false
property :language, String, desired_state: false
property :locale, String, desired_state: false
property :timezone, String, desired_state: false

## script: method 1
property :content, String, desired_state: false
property :first_boot, [TrueClass, FalseClass], desired_state: false

# {{target_volume}} - used to refer to the target volume
# {{serial_number}} - access to the machine's serial number
# {{machine_model}} - access to the machine's model

## script: method 2
property :url, String, desired_state: false
property :additional_headers, Array, desired_state: false

## partition
property :map, String, desired_state: false
property :partitions, Array, desired_state: false

## erase_volume
property :name, String, desired_state: false
property :format, String, desired_state: false

default_action :create

action_class do
  include ImagrCookbook::Helpers

  def options
    {
      package:           {
        url:    new_resource.url,
        verify: new_resource.verify },
      included_workflow: {
        workflow_name: new_resource.workflow_name,
        script:        new_resource.script },
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
end
