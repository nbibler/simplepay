require File.dirname(__FILE__) + '/../../test_helper'
require 'simplepay/services/subscription'

class Simplepay::Services::TestSubscription < Test::Unit::TestCase
  
  def self.model_class; Simplepay::Services::Subscription; end
  
  context 'Simplepay::Services::Subscription' do
    
    should_have_service_field :immediate_return,
                              :class    => Simplepay::Support::Boolean, 
                              :as       => 'immediateReturn',
                              :required => false
    
    should_have_service_field :number_of_promotion_transactions,  
                              :as       => 'noOfPromotionTransactions',
                              :required => false
    
    should_have_service_field :start_date,
                              :class    => Simplepay::Support::Epoch, 
                              :as       => 'recurringStartDate',
                              :required => false
    
    should_have_service_field :collect_shipping_address,
                              :as       => 'collectShippingAddress', 
                              :required => false,
                              :class    => Simplepay::Support::Boolean
    
    should_have_service_field :promotion_amount,
                              :as       => 'promotionAmount', 
                              :required => false,
                              :class    => Simplepay::Support::Amount
    
    should_have_service_field :access_key,
                              :as       => 'accessKey', 
                              :required => true
    
    should_have_service_field :subscription_period,
                              :as       => 'subscriptionPeriod', 
                              :required => false,
                              :class    => Simplepay::Support::SubscriptionPeriod

    should_have_service_field :reference_id,
                              :as       => 'referenceId', 
                              :required => false

    should_have_service_field :recurring_frequency,
                              :as       => 'recurringFrequency', 
                              :required => true,
                              :class    => Simplepay::Support::BillingFrequency

    should_have_service_field :amount,
                              :as       => 'amount', 
                              :required => true,
                              :class    => Simplepay::Support::Amount

    should_have_service_field :variable_marketplace_fee,
                              :as       => 'variableMarketplaceFee', 
                              :required => false

    should_have_service_field :signature,
                              :as       => 'signature', 
                              :required => true

    should_have_service_field :donation_widget,
                              :as       => 'isDonationWidget', 
                              :required => false,
                              :class    => Simplepay::Support::Boolean

    should_have_service_field :fixed_marketplace_fee,
                              :as       => 'fixedMarketplaceFee', 
                              :required => false

    should_have_service_field :auto_renew,
                              :as       => 'isAutoRenewal', 
                              :required => false,
                              :class    => Simplepay::Support::Boolean

    should_have_service_field :description,
                              :as       => 'description', 
                              :required => true

    should_have_service_field :account_id,
                              :as       => 'amazonPaymentsAccountId', 
                              :required => true

    should_have_service_field :ipn_url,
                              :as       => 'ipnUrl', 
                              :required => false

    should_have_service_field :return_url,
                              :as       => 'returnUrl', 
                              :required => false

    should_have_service_field :process_immediately,
                              :as       => 'processImmediate', 
                              :required => false,
                              :class    => Simplepay::Support::Boolean

    should_have_service_field :cobranding_style,
                              :as       => 'cobrandingStyle', 
                              :required => true

    should_have_service_field :abandon_url,
                              :as       => 'abandonUrl', 
                              :required => false
    
  end
  
end
