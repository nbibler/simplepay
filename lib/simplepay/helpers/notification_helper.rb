require 'simplepay/authentication'

module Simplepay
  module Helpers
    
    module NotificationHelper
      
      protected
      
      
      def valid_simplepay_request?(request_hash)
        hash      = request_hash.symbolize_keys
        signature = hash.delete(:signature) || ''
        Simplepay::Authentication.authentic?(hash, signature)
      end
      
    end
    
  end
end
