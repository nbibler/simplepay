module Simplepay
  module Services
  
    ##
    # A Simple Pay Subscription is an automatically recurring payment which is
    # charged every interval (Simplepay::Support::BillingFrequency) until
    # a limiting period (Simplepay::Support::SubscriptionPeriod) is met.
    # 
    # For example, you may charge your customer:
    # 
    #     $10.00 every 3 days until 9 days.
    #     $9.95 every 1 month until forever.
    # 
    class Subscription < Service
      
      required_field :access_key
      required_field :signature
      required_field :account_id,           :as     => :amazon_payments_account_id
      
      required_field :recurring_frequency,  :class  => Support::BillingFrequency
      required_field :description
      required_field :amount,               :class  => Support::Amount
      required_field :cobranding_style,     :value  => 'logo'
      
      field :subscription_period,           :class  => Support::SubscriptionPeriod
      field :reference_id
      field :immediate_return,              :class  => Support::Boolean
      field :start_date,                    :class  => Support::Epoch,
                                            :as     => :recurring_start_date
      field :collect_shipping_address,      :class  => Support::Boolean
      field :process_immediately,           :class  => Support::Boolean,
                                            :as     => :process_immediate
      field :auto_renew,                    :class  => Support::Boolean,
                                            :as     => :is_auto_renewal

      field :return_url
      field :ipn_url
      field :abandon_url
      
      # Used for trial periods
      field :promotion_amount,              :class  => Support::Amount
      field :number_of_promotion_transactions, :as  => :no_of_promotion_transactions
      
      # These fields are not currently utilized by the service
      field :variable_marketplace_fee,      :value  => ''
      field :donation_widget,               :as     => :is_donation_widget,
                                            :value  => '0'
      field :fixed_marketplace_fee,         :value  => ''
      
    end
    
  end
end