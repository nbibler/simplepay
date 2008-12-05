require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/support/interval'

class TestInterval < Simplepay::Support::Interval
  ALLOWED_QUANTITY_RANGE  = (1..200)
  ALLOWED_INTERVALS       = ['testinterval', 'testinterval2']
  DEFAULT_QUANTITY        = 3
  DEFAULT_INTERVAL        = 'testinterval'
end

class Simplepay::Support::TestInterval < Test::Unit::TestCase
  
  context 'Simplepay::Support::Interval' do
    
    setup do
      @interval = TestInterval.new
    end
    
    should 'set the default quantity' do
      assert_equal 3, @interval.quantity
    end
    
    should 'set the default interval' do
      assert_equal 'testinterval', @interval.interval
    end
    
    should 'properly convert to string' do
      assert_equal '3 testinterval', @interval.to_s
    end
    
    should 'return nil with converted to a string with no interval set' do
      @interval.interval = nil
      assert_nil @interval.to_s
    end
    
    should 'raise an error for quantities outside of the allowed range' do
      assert_raises(ArgumentError) {
        @interval.quantity = @interval.class.allowed_quantity_range.last + 1
      }
    end
    
    should 'accept valid quantities' do
      assert_nothing_raised(Exception) {
        @interval.quantity = @interval.class.allowed_quantity_range.first
        @interval.quantity = @interval.class.allowed_quantity_range.first + 1
        @interval.quantity = @interval.class.allowed_quantity_range.last - 1
        @interval.quantity = @interval.class.allowed_quantity_range.last
      }
      assert_equal @interval.class.allowed_quantity_range.last, @interval.quantity
    end
    
    should 'raise an error for intervals which are not allowed' do
      assert_raises(ArgumentError) {
        @interval.interval = 'badtestinterval'
      }
    end
    
    should 'accept valid intervals' do
      assert_nothing_raised(Exception) {
        @interval.interval = @interval.class.allowed_intervals.first
        @interval.interval = @interval.class.allowed_intervals.last
      }
      assert_equal @interval.class.allowed_intervals.last, @interval.interval
    end
    
    should 'be definable by string' do
      interval = TestInterval.new("5 testinterval2")
      assert_equal 5, interval.quantity
      assert_equal 'testinterval2', interval.interval
    end
    
    should 'raise an error for an improperly formatted string' do
      assert_raise(ArgumentError) {
        TestInterval.new("Bad String")
      }
    end
    
    should 'be definable by parameter' do
      interval = TestInterval.new(5, 'testinterval2')
      assert_equal 5, interval.quantity
      assert_equal 'testinterval2', interval.interval
    end
    
    should 'be definable by a hash' do
      interval = TestInterval.new({:quantity => 5, :interval => 'testinterval2'})
      assert_equal 5, interval.quantity
      assert_equal 'testinterval2', interval.interval
    end
    
  end
  
end
