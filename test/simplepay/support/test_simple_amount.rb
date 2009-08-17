require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/support/simple_amount'

class Simplepay::Support::TestSimpleAmount < Test::Unit::TestCase
  
  context 'Simplepay::Support::SimpleAmount' do
    
    should 'convert to Amazon formatted string' do
      assert_equal '5.00', new_amount(5).to_s
      assert_equal '6.10', new_amount(6.1).to_s
      assert_equal '5.25', new_amount(5.25).to_s
    end
    
    should 'raise an error for negative amounts' do
      assert_raise(ArgumentError) { new_amount(-1) }
    end
    
  end
  
  
  private
  
  
  def new_amount(amount)
    Simplepay::Support::SimpleAmount.new(amount)
  end
  
end