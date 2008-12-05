require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/support/amount'

class Simplepay::Support::TestAmount < Test::Unit::TestCase
  
  context 'Simplepay::Support::Amount' do
    
    should 'convert to Amazon formatted string' do
      assert_equal 'USD 5.00', new_amount(5).to_s
      assert_equal 'USD 6.10', new_amount(6.1).to_s
      assert_equal 'USD 5.25', new_amount(5.25).to_s
    end
    
    should 'raise an error for negative amounts' do
      assert_raise(ArgumentError) { new_amount(-1) }
    end
    
    should 'be able to set your desired currency by code' do
      amount = new_amount(1, 'USD')
      assert_equal 'USD', amount.currency.to_s
    end
    
    should 'raise an error when using an unrecognized currency code' do
      assert_raise(ArgumentError) { new_amount(1, 'BADCURRENCYCODE') }
    end
    
    should 'be able to use a custom currency by object' do
      custom = Simplepay::Support::Currency.new('Test Currency', 'TEST', "%d")
      amount = new_amount(1, custom)
      assert_equal custom, amount.currency
      assert_equal "TEST 1", amount.to_s
    end
    
  end
  
  
  private
  
  
  def new_amount(amount, currency = nil)
    currency ? 
      Simplepay::Support::Amount.new(amount, currency) :
      Simplepay::Support::Amount.new(amount)
  end
  
end