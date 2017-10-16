require_relative 'imagr_workflow'

module Imagr
  class ImagrComponent < Imagr::ImagrWorkflow
    resource_name :imagr_component

    default_action :create

    property :component_type, String, name_property: true
    property :workflow, String, required: true

    case new_resource.component_type
    when 'image'
    when 'package'
    when 'computer_name'
    when 'localization'
    when 'scripts'
    when 'partition'
    when 'erase_volume'
    end

    action :create do
      ImagrWorkflow.imagr_config['workflows'][new_resource.workflow]['components'] = {}
    end
  end
end
