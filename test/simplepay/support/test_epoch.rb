require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/support/epoch'

class Simplepay::Support::TestEpoch < Test::Unit::TestCase
  
  context "Simplepay::Support::Epoch" do
    
    should 'return time as an integer' do
      time = Time.now
      assert_equal time.to_i.to_s, new_epoch(time).to_s
    end
    
    should 'parse a given string for Time' do
      assert_equal "1199150625", new_epoch("2008-01-01 01:23:45Z").to_s
    end
    
    should 'represent seconds since January 1, 1970' do
      time    = Time.parse("1970-01-01 00:00:00Z")
      now     = Time.now
      seconds = (now - time).to_i
      assert_equal seconds.to_s, new_epoch(now).to_s
    end
    
  end
  
  
  private
  
  
  def new_epoch(value)
    Simplepay::Support::Epoch.new(value)
  end
  
end