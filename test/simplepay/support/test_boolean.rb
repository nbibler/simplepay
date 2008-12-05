require File.dirname(__FILE__) + '/../../test_helper'

class Simplepay::Support::BooleanTest < Test::Unit::TestCase
  
  context 'Simplepay::Support::Boolean' do
    
    should 'use "1" for true' do
      assert_equal '1', Simplepay::Support::Boolean.new(true).to_s
    end
    
    should 'use "0" for false' do
      assert_equal '0', Simplepay::Support::Boolean.new(false).to_s
    end
    
  end
  
end