module Simplepay
  module Helpers
    
    module FormHelper
      
      def self.tag(name, options = nil, open = false)
        "<#{name}#{tag_options(options) if options}" + (open ? ">" : " />")
      end
      
      def self.content_tag(name, content, options = nil)
        "<#{name}#{tag_options(options)}>#{content}</#{name}>".try(:html_safe)
      end
      
      
      private
      
      
      def self.tag_options(options)
        unless options.blank?
          attrs = []
          attrs = options.map { |key, value| %(#{key}="#{value}") }
          " #{attrs.sort * ' '}" unless attrs.empty?
        end
      end
      
    end
    
  end
end