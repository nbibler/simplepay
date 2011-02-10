require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/services/marketplace'

class Simplepay::Services::TestMarketplace < Test::Unit::TestCase
  
  def self.model_class; Simplepay::Services::Marketplace; end
  
  context 'Simplepay::Services::Marketplace' do
    
    should_have_service_field :access_key,
                              :as       => 'accessKey', 
                              :required => true

    should_have_service_field :signature,
                              :as       => 'signature', 
                              :required => true                              

    should_have_service_field :description,
                              :as       => 'description', 
                              :required => true

    should_have_service_field :amount,
                              :as       => 'amount', 
                              :required => true,
                              :class    => Simplepay::Support::Amount

    should_have_service_field :recipient_email,
                              :as       => 'recipientEmail',
                              :required => true

    should_have_service_field :fixed_marketplace_fee,
                              :as       => 'fixedMarketplaceFee',
                              :required => true,
                              :class    => Simplepay::Support::Amount

    should_have_service_field :variable_marketplace_fee,
                              :as       => 'variableMarketplaceFee',
                              :required => true

    should_have_service_field :cobranding_style,
                              :as       => 'cobrandingStyle', 
                              :required => true

    should_have_service_field :reference_id,
                              :as       => 'referenceId', 
                              :required => false

    should_have_service_field :immediate_return,
                              :as       => 'immediateReturn', 
                              :required => false,
                              :class    => Simplepay::Support::Boolean

    should_have_service_field :collect_shipping_address,
                              :as       => 'collectShippingAddress', 
                              :required => false,
                              :class    => Simplepay::Support::Boolean

    should_have_service_field :process_immediately,
                              :as       => 'processImmediate', 
                              :required => false,
                              :class    => Simplepay::Support::Boolean

    should_have_service_field :return_url,
                              :as       => 'returnUrl', 
                              :required => false

    should_have_service_field :abandon_url,
                              :as       => 'abandonUrl', 
                              :required => false

    should_have_service_field :ipn_url,
                              :as       => 'ipnUrl', 
                              :required => false

    should_have_service_field :donation_widget,
                              :as       => 'isDonationWidget', 
                              :required => false

  end
  
end
