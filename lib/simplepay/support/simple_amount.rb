require 'bigdecimal'

module Simplepay
  module Support
    
    ##
    # In new Amazon API requests the amount does not include the currency, SimpleAmount is used for this, for now.
    # 
    # At the present time, Amazon only uses USD.
    # 
    class SimpleAmount
      
      attr_reader :amount
      
      def initialize(amount)
        self.amount   = amount
      end
      
      
      ##
      # Sets the amount of the currency value, such as "1" for 1 USD.  This
      # amount cannot be negative.
      # 
      def amount=(amount)
        raise(ArgumentError, "Amount cannot be nil") unless amount
        raise(ArgumentError, "Amount cannot be negative") if amount < 0
        @amount = BigDecimal.new(amount.to_s)
      end
      
      def to_s
        "#{'%0.2f' % amount}"
      end
      
    end
    
  end
end
