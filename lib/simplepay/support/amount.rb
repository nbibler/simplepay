require 'bigdecimal'

module Simplepay
  module Support
    
    ##
    # Amazon often represents dollar values as a combination of a value and a 
    # currency.  In several types of requests, the combination is required for
    # communication.
    # 
    # At the present time, Amazon only uses USD.
    # 
    class Amount
      
      attr_reader :amount
      attr_reader :currency
      
      def initialize(amount, currency = Simplepay::Currency::USD)
        self.amount   = amount
        self.currency = currency
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
      
      ##
      # Sets the type of currency to use in the transaction.  The parameter
      # can either be a known currency code (see Simplepay::Currency) or a
      # custom Simplepay::Currency::Currency instance.
      # 
      def currency=(currency)
        raise(ArgumentError, "Invalid currency, expected Simplepay::Support::Currency or currency code string.") unless currency.kind_of?(Simplepay::Support::Currency) || currency.kind_of?(String)
        if currency.kind_of?(String)
          currency =  Simplepay::Currencies.detect { |c| c.code == currency } ||
                      raise(ArgumentError, "Invalid currency, '#{currency}'. Must be one of: #{Simplepay::Currencies.join(', ')}")
        end
        @currency = currency
      end
      
      def to_s
        "#{currency.code} #{currency.format % amount}"
      end
      
    end
    
  end
end
