require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/support/subscription_period'

class Simplepay::Support::TestSubscriptionPeriod < Test::Unit::TestCase
  
  context 'Simplepay::Support::SubscriptionPeriod' do
    
    setup do
      @interval = Simplepay::Support::SubscriptionPeriod.new
    end
    
    should 'not set default values' do
      assert_nil @interval.interval
      assert_nil @interval.quantity
    end
    
    should 'only allow defined intervals' do
      intervals = ['day', 'week', 'month', 'year', 'forever']
      added     = @interval.class.allowed_intervals - intervals
      missed    = intervals - @interval.class.allowed_intervals
      assert added.empty?,  "#{@interval.class.name} defines unexpected intervals: #{added.inspect}"
      assert missed.empty?, "#{@interval.class.name} failed to define expected intervals: #{missed.inspect}"
    end
    
    should 'limit quantities to three digits' do
      assert_nothing_raised(ArgumentError) { @interval.quantity = 999 }
      assert_raise(ArgumentError) { @interval.quantity = 1000 }
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
    
    should 'return nil when converted to string with FOREVER interval' do
      @interval.interval = 'forever'
      assert_nil @interval.to_s
    end
    
  end
  
end
