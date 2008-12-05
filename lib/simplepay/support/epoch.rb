module Simplepay
  module Support
    
    ##
    # Acts as a Simplepay::Support::Field <tt>:class</tt> delegator.
    # 
    # This class provides a means to have Time values returned as an integer
    # since epoch (January 1, 1970).
    # 
    class Epoch
      
      def initialize(time)
        @value = time ? parse(time) : Time.now
      end
      
      ##
      # Returns a String of Integers, representing seconds since epoch.
      # 
      def to_s
        @value.to_i.to_s
      end
      
      
      private
      
      
      def parse(time)
        case time
        when Time, Date, DateTime
          time
        else
          Time.parse(time)
        end
      end
      
    end
    
  end
end