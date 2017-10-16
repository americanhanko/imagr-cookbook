module Imagr
  module ComponentHelpers
    def component_data
      {}
    end

    def package; end

    def image; end

    def computer; end

    def localization; end

    def partition; end

    def erase_volume; end

    def scripts; end
  end
end

#
# The module you have defined may be extended within the recipe to grant the
# recipe the helper methods you define.
#
# Within your recipe you would write:
#
#     extend Imagr::HelpersHelpers
#
#     my_helper_method
#
# You may also add this to a single resource within a recipe:
#
#     template '/etc/app.conf' do
#       extend Imagr::HelpersHelpers
#       variables specific_key: my_helper_method
#     end
#
