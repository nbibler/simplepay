require 'action_view/base'

module Simplepay
  module Helpers
    
    ##
    # Adds helpers to your views for generating the correct HTML forms and 
    # valid signatures.
    # 
    module RailsHelper
      
      ##
      # This is the general interface for generating your Simple Pay service
      # forms.  See Simplepay::Services for available services and information
      # specific to each.
      # 
      # === Example
      # 
      #     (in your view)
      # 
      #     <%= simplepay_form_for(:service_name, {:attr => 'foo'}) %>
      # 
      def simplepay_form_for(service_name, attributes = {}, submit_tag = nil)
        service = get_simplepay_service(service_name)
        service.form(attributes, submit_tag)
      end
      
      
      private
      
      
      def get_simplepay_service(name) #:nodoc:
        service = "Simplepay::Services::#{name.to_s.camelize}".constantize
        service.new
      end
      
    end
    
  end
end
