module Simplepay
  module Services
  
    ##
    # The Amazon Simple Pay Standard service is used for one-time payments.
    # 
    # === Simple Pay Standard Fields
    # 
    # ==== Required Fields
    # 
    # The following attributes are required when creating a Simple Pay 
    # Standard form (in addition to those listed in +Simplepay::Service+):
    # 
    # amount:: The dollar value you'd like to collect.
    # description:: A summary of the reason for the payment, this is displayed to your customer during checkout.
    # 
    # ==== Optional Fields
    # 
    # abandon_url:: The fully-qualified URL to send your custom if they cancel during payment.
    # cobranding_style:: Defines the type of cobranding to use during the checkout process.
    # collect_shipping_address:: Tells Amazon whether or not to ask for shipping address and contact information.
    # immediate_return:: Immediately returns the customer to your +return_url+ directly after payment.
    # ipn_url:: Fully-qualified URL to which Amazon will POST instant payment notifications.
    # process_immediately:: Instructs Amazon to immediately process the payment.
    # reference_id:: A custom string your can set to identify this transaction, it will be returned with the IPNs and other returned data.
    # return_url:: Fully-qualified URL for where to send your customer following payment.
    # 
    # === Example
    # 
    #     (in your view, using the form helper)
    #     
    #     <%= simplepay_form_for(:standard, {
    #       :amount       => 34.95,
    #       :description  => "I want my money NOW!"
    #     }) %>
    # 
    class Standard < Service
      
      required_field :access_key
      required_field :signature
      required_field :account_id,           :as     => :amazon_payments_account_id
      
      required_field :description
      required_field :amount,               :class  => Support::Amount
      required_field :cobranding_style,     :value  => 'logo'
      
      field :reference_id
      field :immediate_return,              :class  => Support::Boolean
      field :collect_shipping_address,      :class  => Support::Boolean
      field :process_immediately,           :class  => Support::Boolean,
                                            :as     => :process_immediate

      field :return_url
      field :ipn_url
      field :abandon_url
      
      # These fields are not currently utilized by the service
      field :variable_marketplace_fee,      :value  => ''
      field :donation_widget,               :as     => :is_donation_widget,
                                            :value  => '0'
      field :fixed_marketplace_fee,         :value  => ''
      
    end
    
  end
end