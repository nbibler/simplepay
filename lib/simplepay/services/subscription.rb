module Simplepay
  module Services
  
    ##
    # A Simple Pay Subscription is an automatically recurring payment which is
    # charged every interval (Simplepay::Support::BillingFrequency) until
    # a limiting period (Simplepay::Support::SubscriptionPeriod) is met.
    # 
    # With this type of payment, for example, you may charge your customer:
    # 
    #     $10.00 every 3 days until 9 days.
    #     $9.95 every 1 month until forever.
    # 
    # === Simple Pay Subscription Fields
    # 
    # === Required Fields
    # 
    # The following attributes are required when creating a Simple Pay 
    # Subscription form (in addition to those listed in +Simplepay::Service+):
    # 
    # amount:: The dollar value you'd like to collect.
    # description:: A summary of the reason for the payment, this is displayed to your customer during checkout.
    # recurring_frequency:: Defines how often to charge your customer (ex. "1 month")
    # 
    # ==== Optional Fields
    # 
    # abandon_url:: The fully-qualified URL to send your custom if they cancel during payment.
    # auto_renew:: Instructs Amazon to automatically renew the subscription after the +subscription_period+ ends.
    # cobranding_style:: Defines the type of cobranding to use during the checkout process.
    # collect_shipping_address:: Tells Amazon whether or not to ask for shipping address and contact information.
    # immediate_return:: Immediately returns the customer to your +return_url+ directly after payment.
    # ipn_url:: Fully-qualified URL to which Amazon will POST instant payment notifications.
    # process_immediately:: Instructs Amazon to immediately process the payment.
    # reference_id:: A custom string your can set to identify this transaction, it will be returned with the IPNs and other returned data.
    # return_url:: Fully-qualified URL for where to send your customer following payment.
    # start_date:: Instructs Amazon with the timestamp to start the recurring subscription charges.
    # subscription_period:: Defines the expiration window of the subscription (i.e. charge +amount+ every +recurring_frequency+ for "36 months")
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