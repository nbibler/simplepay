module Simplepay
  module Support
    
    class Interval
      
       # If set, limits the quantity to a value within this range
      ALLOWED_QUANTITY_RANGE  = nil
      
      # If set, limits the interval set to a value within this array
      ALLOWED_INTERVALS       = nil
      
      # Sets the default quantity value for new instances
      DEFAULT_QUANTITY        = nil
      
      # Sets the default interval value for new instances
      DEFAULT_INTERVAL        = nil
      
      # The numeric number of intervals
      attr_reader :quantity
      
      # The interval, or "period", of time
      attr_reader :interval
      
      
      class << self
        
        def allowed_intervals
          const_get(:ALLOWED_INTERVALS)
        end
        
        def allowed_quantity_range
          const_get(:ALLOWED_QUANTITY_RANGE)
        end
        
        def default_quantity
          const_get(:DEFAULT_QUANTITY)
        end
        
        def default_interval
          const_get(:DEFAULT_INTERVAL)
        end
        
      end
      
      
      ##
      # Creates an instance of the Interval.  This can be called in one of 
      # several ways:
      # 
      # no arguments:: Creates a new interval instance with default values.
      # one argument, string:: Creates a new interval by parsing the given string to set both the quantity and interval.  Must be formatted as: "3 day" (quantity, space, interval)
      # one argument, hash:: Creates a new interval and populates it with the given :quantity and :interval.  Uses defaults if not given.
      # two arguments:: Creates a new interval with the first argument as the quantity, second argument as the interval.
      # 
      # === Examples
      # 
      # All of these are equivalent:
      # 
      #     Interval.new("3 day")
      #     Interval.new({:quantity => 3, :interval => 'day'})
      #     Interval.new(3, 'day')
      # 
      def initialize(*args)
        parse_arguments(*args)
      end
      
      ##
      # Set the interval.
      # 
      def interval=(i)
        raise(ArgumentError, "Interval '#{i}' should be one of: #{allowed_intervals.join(', ')}") if i && allowed_intervals && !allowed_intervals.include?(i)
        @interval = i
      end
      
      ##
      # Set the quantity.
      # 
      def quantity=(q)
        raise(ArgumentError, "Quantity '#{q}' should be in #{allowed_quantity_range}") if q && allowed_quantity_range && !allowed_quantity_range.include?(q)
        @quantity = q
      end
      
      ##
      # Converts the interval into an Amazon-ready string.
      # 
      #     Interval.new(3, 'day').to_s # => "3 day"
      # 
      def to_s
        "#{quantity} #{interval}" if interval
      end
      
      def allowed_intervals #:nodoc:
        self.class.allowed_intervals
      end
      
      def allowed_quantity_range #:nodoc:
        self.class.allowed_quantity_range
      end
      
      def default_quantity #:nodoc:
        self.class.default_quantity
      end
      
      def default_interval #:nodoc:
        self.class.default_interval
      end
      
      
      private
      
      
      def parse_arguments(*args)
        case args.size
        when 0
          self.quantity = self.default_quantity
          self.interval = self.default_interval
        when 1
          case args.first
          when String
            parse_values_from(args.first)
          when Hash
            self.quantity = args.first[:quantity] || self.default_quantity
            self.interval = args.first[:interval] || self.default_interval
          end
        else
          self.quantity = args.first
          self.interval = args[1]
        end
      end
      
      def parse_values_from(s)
        if s =~ /\A([\d]+)\s+([\w]+)\Z/
          self.quantity = $1.to_i
          self.interval = $2
        else
          raise ArgumentError, "Unrecognzied initialization string given: #{s.inspect}"
        end
      end
      
    end
    
  end
end