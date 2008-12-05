require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/support/billing_frequency'

class Simplepay::Support::TestBillingFrequency < Test::Unit::TestCase
  
  context 'Simplepay::Support::BillingFrequency' do
    
    setup do
      @interval = Simplepay::Support::BillingFrequency.new
    end
    
    should 'not set default values' do
      assert_nil @interval.interval
      assert_nil @interval.quantity
    end
    
    should 'only allow defined intervals' do
      intervals = ['day', 'week', 'month', 'year']
      added     = @interval.class.allowed_intervals - intervals
      missed    = intervals - @interval.class.allowed_intervals
      assert added.empty?,  "#{@interval.class.name} defines unexpected intervals: #{added.inspect}"
      assert missed.empty?, "#{@interval.class.name} failed to define expected intervals: #{missed.inspect}"
    end
    
    should 'limit quantities to two digits' do
      assert_raise(ArgumentError) { @interval.quantity = 100 }
    end
    
    should 'disallow 0 quantity' do
      assert_raise(ArgumentError) { @interval.quantity = 0 }
    end
    
    should 'disallow negative quantities' do
      assert_raise(ArgumentError) { @interval.quantity = -1 }
    end
    
    should 'convert to String' do
      assert_equal '5 year', @interval.class.new(5, 'year').to_s
    end
    
  end
  
end
