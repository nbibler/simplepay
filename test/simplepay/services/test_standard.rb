require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/services/subscription'

class Simplepay::Services::TestStandard < Test::Unit::TestCase
  
  def self.model_class; Simplepay::Services::Standard; end
  
  context 'Simplepay::Services::Standard' do

    # these 'old' fields shouldn't be there anymore
    should_not_have_service_field :account_id
        
    # fields the service should have
    
    # common fields to all services
    should_have_service_field :signature,
                              :as       => 'awsSignature', 
                              :required => true
    
    should_have_service_field :access_key,
                              :as       => 'callerKey', 
                              :required => true

    should_have_service_field :cobranding_style,
                              :as       => 'cobrandingStyle', 
                              :required => false
                              
    should_have_service_field :cobranding_url,
                              :as       => 'cobrandingUrl',
                              :required => false
                              
    should_have_service_field :pipeline_name,
                              :as       => 'pipelineName',
                              :required => true

    should_have_service_field :return_url,
                              :as       => 'returnUrl', 
                              :required => true
                              
    should_have_service_field :version,
                              :required => true
                              
    should_have_service_field :website_description,
                              :as       => 'websiteDescription',
                              :required => false

    # standard service fields
    should_have_service_field :address_name,
                              :as       => 'addressName',
                              :required => false
                              
    should_have_service_field :address_line1,
                              :as       => 'addressLine1',
                              :required => false
                              
    should_have_service_field :address_line2,
                              :as       => 'addressLine2',
                              :required => false

    should_have_service_field :city,
                              :as       => 'city',
                              :required => false

    should_have_service_field :state,
                              :as       => 'state',
                              :required => false

    should_have_service_field :zip,
                              :as       => 'zip',
                              :required => false

    should_have_service_field :phone_number,
                              :as       => 'phoneNumber',
                              :required => false

    should_have_service_field :reference_id,
                              :as       => 'callerReference', 
                              :required => true

    should_have_service_field :collect_shipping_address,
                              :as       => 'collectShippingAddress', 
                              :required => false,
                              :class    => Simplepay::Support::Boolean

    should_have_service_field :currency_code,
                              :as       => 'currencyCode',
                              :required => false

    should_have_service_field :discount,
                              :required => false

    should_have_service_field :gift_wrapping,
                              :as       => 'giftWrapping',
                              :required => false

    should_have_service_field :handling,
                              :required => false,
                              :class    => Simplepay::Support::SimpleAmount

    should_have_service_field :item_total,
                              :as       => 'itemTotal', 
                              :required => false,
                              :class    => Simplepay::Support::SimpleAmount

    # Default ABT (CC | ACH | ABT)
    should_have_service_field :payment_method,
                              :as       => 'paymentMethod', 
                              :required => false

    should_have_service_field :payment_reason,
                              :as       => 'paymentReason', 
                              :required => false

    should_have_service_field :reserve,
                              :required => false

    should_have_service_field :shipping,
                              :required => false,
                              :class    => Simplepay::Support::SimpleAmount

    should_have_service_field :tax,
                              :required => false,
                              :class    => Simplepay::Support::SimpleAmount
                        
    should_have_service_field :transaction_amount,
                              :as       => 'transactionAmount', 
                              :required => true,
                              :class    => Simplepay::Support::SimpleAmount

    should_have_service_field :ipn_url,
                              :as       => 'ipnUrl', 
                              :required => false

  end
  
end
