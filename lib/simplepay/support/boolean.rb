module Simplepay
  module Support
    
    ##
    # Acts as a delegator for Simplepay::Support::Field <tt>:class</tt>.
    # 
    # This class acts as a helper for sending boolean values to Amazon.  In
    # their forms, booleans are expected to be either "0" or "1", for false or
    # true, respectively.
    # 
    class Boolean
      
      def initialize(value)
        @value = value
      end
      
      ##
      # Returns "1" if the boolean is true, "0" otherwise.
      # 
      def to_s
        return '' if @value.nil?
        @value ? Simplepay::Boolean::True : Simplepay::Boolean::False
      end
      
    end
    
  end
end