# require 'action_view/helpers/form_tag_helper'
# require 'action_view/helpers/capture_helper'
require 'erb'

module Simplepay
  module Helpers
    
    module FormHelper
      
      def self.tag(name, options = nil, open = false)
        "<#{name}#{tag_options(options) if options}" + (open ? ">" : " />")
      end
      
      def self.content_tag(name, content, options = nil)
        "<#{name}#{tag_options(options)}>#{content}</#{name}>"
      end
      
      
      private
      
      
      def self.tag_options(options)
        unless options.blank?
          attrs = []
          attrs = options.map { |key, value| %(#{key}="#{value}") }
          " #{attrs.sort * ' '}" unless attrs.empty?
        end
      end
      
      # extend ActionView::Helpers::TagHelper
      # extend ActionView::Helpers::FormTagHelper
      # extend ActionView::Helpers::CaptureHelper
    end
    
  end
end