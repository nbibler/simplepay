module Simplepay
  
  ##
  # All SimplePay errors will inherit from the base Simplepay::Error.
  # 
  class Error < RuntimeError; end
  
  #:stopdoc:
  
  class RequiredFieldMissing < Error; end
  class InvalidOptions < Error; end
  class ParseError < Error; end
  
  #:startdoc:
  
end