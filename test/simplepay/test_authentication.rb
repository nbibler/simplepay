require File.dirname(__FILE__) + '/../test_helper'
require 'simplepay/authentication'

class Simplepay::TestAuthentication < Test::Unit::TestCase
  
  context 'Simplepay::Authentication' do
    
    setup do
      @secret_key = "TESTINGKEY"
      @signature  = 'c7Nyzt61Bwe2pec9rO2nM5ZjmC0='
      @data = {
        :symbol   => 'string',
        'string'  => 1,
        2         => :symbol
      }
      @auth = Simplepay::Authentication
    end
    
    should 'compute an Amazon signature for hash data' do
      assert_equal @signature, @auth.generate(@data, @secret_key)
    end
    
    should 'authenticate correctly signed data' do
      assert @auth.authentic?(@data, @signature, @secret_key)
    end
    
    should 'not validate incorrectly signed data' do
      assert !@auth.authentic?(@data, 'thisisnotavalidsignaturetoo=', @secret_key)
    end
    
  end
  
end