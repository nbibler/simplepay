require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/services/marketplace_policy'

class Simplepay::Services::TestMarketplacePolicy < Test::Unit::TestCase
  
  def self.model_class; Simplepay::Services::MarketplacePolicy; end
  
  context 'Simplepay::Services::MarketplacePolicy' do
    
    should_have_service_field :access_key,
                              :as       => 'callerKey', 
                              :required => true

    should_have_service_field :signature,
                              :as       => 'awsSignature', 
                              :required => true

    should_have_service_field :account_id,
                              :as       => 'callerAccountId', 
                              :required => true

    should_have_service_field :max_fixed_fee,
                              :as       => 'maxFixedFee', 
                              :required => true

    should_have_service_field :max_variable_fee,
                              :as       => 'maxVariableFee', 
                              :required => true

    should_have_service_field :return_url,
                              :as       => 'returnUrl', 
                              :required => true

    should_have_service_field :recipient_pays_fee,
                              :as       => 'recipientPaysFee',
                              :required => true

    should_have_service_field :reference_id,
                              :as       => 'callerReference',
                              :required => true

    should_have_service_field :collect_email_address,
                              :as       => 'collectEmailAddress', 
                              :required => true

    should_have_service_field :pipeline_name,
                              :as       => 'pipelineName', 
                              :required => true

  end
  
end
