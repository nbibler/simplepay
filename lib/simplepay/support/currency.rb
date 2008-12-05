module Simplepay
  module Support
    
    ##
    # Contains a name, recognized code, and basic formatting for a particular
    # international monetary currency.
    # 
    class Currency
      attr_reader :name, :code, :format
      
      def initialize(name, code, format)
        @name, @code, @format = name, code, format
      end
      
      def to_s
        "#{code}"
      end
    end
    
  end
end