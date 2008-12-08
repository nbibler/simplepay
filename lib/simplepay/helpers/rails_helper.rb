require 'action_view/base'

module Simplepay
  module Helpers
    
    module RailsHelper
      
      def simplepay_form_for(service_name, attributes = {})
        service = get_simplepay_service(service_name)
        service.form(attributes)
      end
      
      
      private
      
      
      def get_simplepay_service(name)
        service = "Simplepay::Services::#{name.to_s.camelize}".constantize
        service.new
      end
      
    end
    
  end
end
