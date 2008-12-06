require 'openssl'
require 'base64'

module Simplepay
  
  ##
  # This module generates RFC-2104-compliant HMAC signatures.  These 
  # signatures are used by both Amazon and you to determine whether or not
  # data transmitted is authentic.  The hash is based on the amazon secret
  # access key, which is a trusted secret between both parties.
  # 
  # === HMAC (RFC-2104 Specification)
  # 
  # For more information about the RFC-2104 spec, 
  # see http://www.ietf.org/rfc/rfc2104.txt
  #
  module Authentication
    
    class << self
      
      def generate(hash_data, secret_access_key = Simplepay.aws_secret_access_key)
        encode(digest(convert_to_string(hash_data), secret_access_key))
      end
      
      def authentic?(hash_data, signature, secret_access_key = Simplepay.aws_secret_access_key)
        signature == generate(hash_data, secret_access_key)
      end
      
      
      private
      
      
      ##
      # Converts a Hash of key-value pairs into an Amazon compliant block of
      # signature text.
      # 
      #=== Example
      # 
      #     {:key1 => 'Value1', 'foo' => 3 }
      # 
      # would become
      # 
      #     "foo3key1Value1"
      # 
      def convert_to_string(hash)
        raise(ArgumentError, "Expected a Hash of data") unless hash.kind_of?(Hash)
        data    = hash.stringify_keys
        string  = ''
        data.keys.sort.each { |k| string += "#{k}#{data[k]}" unless data[k].blank? }
        string
      end
      
      ##
      # Generate an RFC-2104-compliant HMAC
      # 
      def digest(value, secret_access_key)
        digest = OpenSSL::Digest::Digest.new('sha1')
        OpenSSL::HMAC.digest(digest, secret_access_key, value)
      end
      
      def encode(value)
        Base64.encode64(value).chomp
      end
      
    end
    
  end
  
end