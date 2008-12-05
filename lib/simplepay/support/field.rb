require 'active_support'

module Simplepay
  module Support
    
    ##
    # Represents a data field which will ultimately populate a Simple Pay 
    # form.  These fields are often unique to their service.
    # 
    class Field
      include Comparable
      
      ALLOWED_OPTIONS = [:as, :class, :required, :value]
      
      # The parent service of the field
      attr_reader :service
      
      # The name of the field used in your local program (may be different than the service name)
      attr_reader :name
      
      ##
      # name:: Name which is used when referring to this field in the code.
      # options:: An optional hash of field options.
      # 
      # === Options
      # 
      # as:: Overrides the +name+ when used by the service to the exact string or symbol (camelized) given.
      # class:: Delegate the value mechanics to a separate class.
      # required:: Tells whether or not this field is required for its service.
      # value:: Set the value of the field at initialization.
      # 
      # === Example
      # 
      #     Field.new(:example, :required => true, :as => 'ExAmplE')
      #     Field.new(:delegated, :class => Simplepay::Support::Boolean, :value => true)
      # 
      def initialize(service, name, options)
        @service, @name, @options = service, name, normalize_options!(options)
        @delegate   = options[:class]
        @value      = nil
        self.value  = options[:value] if options[:value]
      end
      
      ##
      # Returns the name of the field used by the service.  This may be 
      # different than the Ruby name given to the field.
      # 
      # Symbol names (or :as options) are camelized.  If this is not desired,
      # use a String, instead.
      # 
      def service_name
        source = @options[:as] || @name
        case source
        when Symbol
          source.to_s.camelize(:lower)
        else
          source
        end
      end
      alias :to_s :service_name
      
      ##
      # Returns +true+ if the field is required for the service.
      # 
      def required?
        @options[:required] ? true : false
      end
      
      ##
      # Converts a Field into an HTML HIDDEN INPUT element as a string.
      # 
      def to_input
        raise(RequiredFieldMissing, "Missing Required Field value for #{name}") if required? && value.blank?
        value ? html_input_tag : ''
      end
      
      def delegated? #:nodoc:
        @delegate
      end
      
      def value=(v) #:nodoc:
        @value = delegated? ? @delegate.new(v) : v
      end
      
      def value #:nodoc:
        if delegated?
          @value.to_s
        else
          case @value
          when Proc
            @value.call(self)
          else
            @value
          end
        end
      end
      
      ##
      # Sorting is based solely by +service_name+.
      # 
      def <=>(o)
        self.service_name <=> o.service_name
      end
      
      def ==(o) #:nodoc:
        self.service  == o.service &&
        self.name     == o.name
      end
      
      def inspect #:nodoc:
        %|#<#{self.class.name} Name:"#{@name}"#{" ServiceName:\"#{service_name}\"" if service_name != @name}#{" REQUIRED" if required?}>|
      end
      
      def clone_for(o) #:nodoc:
        self.class.new(o, deep_clone(@name), deep_clone(@options))
      end
      
      def delegate #:nodoc:
        @delegate
      end
      
      
      private
      
      
      def html_input_tag #:nodoc:
        Simplepay::Helpers::FormHelper.tag(:input, {
          :name   => service_name,
          :value  => value,
          :type   => 'hidden'
        })
      end
      
      def normalize_options!(options) #:nodoc:
        options.symbolize_keys!
        raise(InvalidOptions, "Unrecognized options passed: #{(options.keys - ALLOWED_OPTIONS).join(', ')}") unless (options.keys - ALLOWED_OPTIONS).empty?
        options
      end
      
      def deep_clone(o)
        Marshal::load(Marshal.dump(o))
      end
      
    end
    
  end
end