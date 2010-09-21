require File.dirname(__FILE__) + '/../test_helper'
require 'simplepay/authentication'

class Simplepay::TestAuthentication < Test::Unit::TestCase
  
  context 'Simplepay::Authentication' do
    
    setup do
      @uri        = URI.parse('https://authorize.payments-sandbox.amazon.com/pba/pipeline')
      @secret_key = "TESTINGKEY"
      @signature  = 'Ni8YGsrFZmAJwQN8mCZvTqOlPuNiNCzoi4LqyQS4ums='
      @data = {
        :symbol   => 'string',
        'string'  => 1,
        2         => :symbol
      }
    end

    should 'compute an Amazon signature for hash data' do
      assert_equal @signature, Simplepay::Signature.new(@uri, @data, @secret_key).sign
    end

  end

end
