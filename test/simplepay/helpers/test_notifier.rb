require File.dirname(__FILE__) + '/../../test_helper'
require "simplepay/helpers/notification_helper"

class TestNotificationClass
  include Simplepay::Helpers::NotificationHelper
  
  def testing(request_hash = {})
    valid_simplepay_request?(request_hash)
  end
end

class Simplepay::Helpers::TestNotificationHelper < Test::Unit::TestCase
  
  context 'Simplepay::Helpers::NotificationHelper' do
    
    setup do
      @notifier = TestNotificationClass.new
    end
    
    should 'defer to Simplepay::Authentication.authentic?' do
      Simplepay::Authentication.expects(:authentic?).with({:test => 'testing'}, 'signed').returns(true)
      assert @notifier.testing({:test => 'testing', :signature => 'signed'})
    end
    
    should 'work with string hash keys' do
      Simplepay::Authentication.expects(:authentic?).with({:test => 'testing'}, 'signed').returns(true)
      assert @notifier.testing({"test" => 'testing', "signature" => 'signed'})
    end
    
  end
  
end