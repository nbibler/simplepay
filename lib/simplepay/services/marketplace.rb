module Simplepay
  module Services
  
    ##
    # The Amazon Simple Pay Marketplace service is used to facilitate payments for others.
    # Use it to charge a commission fee for brokering the exchange between buyers and sellers.
    #
    # Note that sellers must accept your marketplace fee policy before the payment buttons
    # for their products can be generated. This can be accomplished using the +MarketplacePolicy+
    # service with the form helper (see examples).
    # 
    # === Simple Pay Marketplace Fields
    # 
    # ==== Required Fields
    # 
    # The following attributes are required when creating a Simple Pay 
    # Marketplace form (in addition to those listed in +Simplepay::Service+):
    # 
    # amount:: The dollar value you'd like to collect.
    # description:: A summary of the reason for the payment, this is displayed to your customer during checkout.
    # recipient_email:: The e-mail address of the seller (important and must be correct).
    # fixed_marketplace_fee:: The fixed marketplace fee to add to each transaction.
    # variable_marketplace_fee:: The variable percentage fee to add to each transaction.
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
    #     (in your view, sellers need to accept the marketplace fee policy using the form helper)
    #
    #     <%= simplepay_form_for(:marketplace_policy, {
    #       :max_fixed_fee    => 10.00,
    #       :max_variable_fee => 5,
    #       :return_url       => 'http://yourservice.com'
    #     }) %>
    #
    #     (in your view, payment form generated for end users using the form helper)
    #     
    #     <%= simplepay_form_for(:standard, {
    #       :amount                   => 34.95,
    #       :description              => "Mutual profit!",
    #       :recipient_email          => 'seller@gmail.com',
    #       :fixed_marketplace_fee    => 10.00,
    #       :variable_marketplace_fee => 5
    #     }) %>
    # 
    class Marketplace < Service
      
      required_field :access_key
      required_field :signature
      required_field :signature_method, :value => 'HmacSHA256'
      required_field :signature_version, :value => '2'
      
      
      required_field :description
      required_field :amount,                   :class  => Support::Amount
      required_field :fixed_marketplace_fee,    :class  => Support::Amount
      required_field :variable_marketplace_fee
      required_field :cobranding_style,         :value  => 'logo'
      required_field :recipient_email
      
      field :reference_id
      field :immediate_return,                  :class  => Support::Boolean
      field :collect_shipping_address,          :class  => Support::Boolean
      field :process_immediately,               :class  => Support::Boolean,
                                                :as     => :process_immediate

      field :return_url
      field :ipn_url
      field :abandon_url
      
      # These fields are not currently utilized by the service
      field :donation_widget,               :as     => :is_donation_widget,
                                            :value  => '0'
      
    end
    
  end
end
