require_relative 'imagr_workflow'

module Imagr
  class ImagrComponent < Imagr::ImagrWorkflow
    resource_name :imagr_component

    default_action :create

    property :component_type, String, name_property: true

    # component_types = %i[image package computer_name localization scripts partition erase_volume]

    action :create do
      ImagrWorkflow.imagr_config['workflows'][new_resource.workflow]['components'] = {}
    end
  end
end
