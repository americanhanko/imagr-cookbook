module ImagrCookbook
  class ImagrComponent < Chef::Resource

  resource_name :imagr_component

  default_action :bind

  property :workflow_name, String, name_property: true

  property :image, String
  property :package, String
  property :computer_name, String
  property :localization, String
  property :scripts, String

  action :bind do
    plist_structure = {}
    plist_structure
  end
end
