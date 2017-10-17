resource_name :imagr_component

property :type, String, name_property: true
property :workflow, String, required: true

# Component Types

## included_workflow
property :name, String
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

## scripts: method 1
property :content, String
property :first_boot, [TrueClass, FalseClass]

# {{target_volume}} - used to refer to the target volume
# {{serial_number}} - access to the machine's serial number
# {{machine_model}} - access to the machine's model

## scripts: method 2
property :url, String
property :additional_headers, Array

## partition

## erase_volume
property :name, String
property :format, String

default_action :create

action :create do
end
