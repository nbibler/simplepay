require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/support/field'

class DelegateTest
  def initialize(v); end
  def to_s; end
end

class Simplepay::Support::TestField < Test::Unit::TestCase
  
  context 'Simplepay::Support::Field' do
    
    should 'raise error for invalid options' do
      assert_raise(Simplepay::InvalidOptions) { new_field(:bad, {:bad_field => 'foo'}) }
    end
    
    should 'set the value via options' do
      assert_equal 'set value', new_field(:test, :value => 'set value').value
    end
    
    should 'camelize the service name when given a symbol' do
      assert_equal 'testField', new_field(:test_field).service_name
    end
    
    should 'use the given string name as service name' do
      assert_equal 'TestField', new_field('TestField').service_name
      assert_equal 'test_field', new_field('test_field').service_name
    end
    
    should 'use the :as option to override the service name' do
      assert_equal 'Overridden', new_field(:original, :as => 'Overridden').service_name
    end
    
    should 'use the service name when converted to String' do
      field = new_field(:test_field)
      assert_equal field.service_name, field.to_s
    end
    
    should 'not be required by default' do
      assert !new_field(:optional_field).required?
    end
    
    should 'be required' do
      assert new_field(:required_field, :required => true).required?
    end
    
    should 'change the service parent for cloned objects' do
      field1 = new_field(:clone)
      field2 = field1.clone_for(new_service)
      assert_equal      field1.name,    field2.name
      assert_equal      field1.value,   field2.value
      assert_not_equal  field1.service, field2.service
    end
    
    should 'be equivalent' do
      field1 = new_field(:equal, {})
      field2 = new_field(:equal, {}, field1.service)
      assert_equal field1, field2
    end
    
    should 'not be equivalent' do
      field1 = new_field(:equal, {}, new_service)
      field2 = new_field(:equal, {}, new_service)
      assert_not_equal field1, field2
    end
    
    should 'correctly sort' do
      fielda, fieldb, fieldc = new_field(:a), new_field(:b), new_field(:c)
      assert_equal [fielda, fieldb, fieldc], [fieldc, fielda, fieldb].sort
    end
    
    should 'pass itself as a proc parameter if value is a proc' do
      field   = new_field(:test, {:value => Proc.new { |f| f}})
      assert_equal field, field.value
    end
    
    should 'be able to delegate value handling to another class' do
      delegate = DelegateTest.new('foo')
      DelegateTest.expects(:new).with('foo').once.returns(delegate)
      delegate.expects(:to_s).times(2).returns('mocked')
      field = new_field(:delegated, {:class => DelegateTest, :value => 'foo'})
      assert_equal delegate.to_s, field.value
    end
    
  end
  
  
  private
  
  
  def new_field(name, options = {}, service = new_service)
    Simplepay::Support::Field.new(service, name, options)
  end
  
  def new_service
    Simplepay::Service.new
  end
  
end
