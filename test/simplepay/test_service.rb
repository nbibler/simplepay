require File.dirname(__FILE__) + '/../test_helper'
require 'rexml/document'
require 'simplepay/service'

class TestService < Simplepay::Service
  ENDPOINT_URL  = 'http://test.host.url/api'
  SANDBOX_URL   = 'http://test.host.url/sandbox'
  
  set_submit_tag 'testing'
  
  field :field_1
  field :field_2
  required_field :required
  required_field :required2, :value => 'preset'
end

class Simplepay::TestService < Test::Unit::TestCase
  
  context 'Simplepay::Service' do
    
    setup do
      @service = ::TestService.new
    end
    
    context 'class' do
      
      setup do
        @class = @service.class
      end
      
      should 'contain the defined fields' do
        fields = @class.fields
        assert_not_nil fields
        assert !fields.empty?
      end
      
      should 'contain required field(s)' do
        fields = @class.fields.select { |f| f.required? }
        assert fields.size > 0
      end
      
      should 'have different field instances than its service instance' do
        class_fields, instance_fields = @class.fields, @service.fields
        instance_fields.each do |instance_field|
          assert !class_fields.include?(instance_field)
          assert class_fields.any? {|f| instance_field.service_name == f.service_name }
        end
      end
      
    end
    
    should 'return a collection of fields' do
      assert !@service.fields.empty?
      assert @service.fields.all? { |f| f.kind_of?(Simplepay::Support::Field) }
    end
    
    should 'use the live endpoint url' do
      assert_equal TestService::ENDPOINT_URL, @service.url(false)
    end
    
    should 'use the sandbox url' do
      assert_equal TestService::SANDBOX_URL, @service.url(true)
    end
    
    should 'generate an HTML FORM' do
      @service.required = 'set'
      assert_match /\A<form/i, @service.form
      assert_match /<\/form>\Z/i, @service.form
    end
    
    should 'post the form to the endpoint' do
      assert_match /<form action="#{Regexp.escape('http://test.host.url/sandbox')}" method="post"/, @service.form({:required => 'set'})
    end
    
    should 'generate HIDDEN HTML INPUTs for each non-empty field' do
      @service.required = 'Test Field'
      @service.field_1  = 'Testing'
      
      defined_fields    = @service.fields.select { |f| !f.value.blank? }
      assert defined_fields.size > 0, "This test cannot be run without defined fields"
      document = REXML::Document.new(@service.form)
      form_inputs = []
      document.root.each_element("//input[@type='hidden']") do |e|
        field = defined_fields.detect { |f| f.service_name == e.attributes['name'] }
        assert field, "#{e} unrecognized"
        form_inputs << e
      end
      assert_equal defined_fields.size, form_inputs.size
    end
    
    should 'allow fields to be set through hash' do
      assert_nothing_raised(Simplepay::RequiredFieldMissing) do
        TestService.new.form({:required => 'covered'})
      end
    end
    
    should 'raise an error for undefined required fields' do
      assert_raise(Simplepay::RequiredFieldMissing) { @service.form }
    end
    
    should 'default to a basic HTML SUBMIT button' do
      document = REXML::Document.new(@service.form({:required => 'set'}))
      assert_not_nil document.root.elements["input[@type='submit']"]
    end
    
    should 'allow class definition of the default submit text' do
      document = REXML::Document.new(@service.form({:required => 'set'}))
      assert_not_nil document.root.elements["input[@type='submit' and @value='testing']"]
    end
    
    should 'allow the HTML SUBMIT button to be overridden' do
      document = REXML::Document.new(@service.form({:required => 'set'}, Simplepay::Helpers::FormHelper.tag(:input, {:type => 'submit', :value => 'Send It'})))
      assert_not_nil document.root.elements["input[@type='submit' and @value='Send It']"]
    end
    
  end
  
end