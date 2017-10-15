resource_name :imagr_workflow

property :name, String, name_property: true
property :password, String
property :autorun, String
property :autorun_time, Integer
property :default_workflow, String
property :background_image, String
property :wait_for_network, [true, false]
property :restart_action, String
