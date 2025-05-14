require 'rails/generators/stimulus/controller_generator'

module Stimulus
  module Generators
    class ControllerGenerator < Rails::Generators::Stimulus::ControllerGenerator
      def update_manifest; end
    end
  end
end
