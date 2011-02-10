module Simplepay
  module Services
  
    ##
    # The Amazon Simple Pay Donation service is used to facilitate the collection 
    # of donations to your organization, or another's organization via the 
    # marketplace functionality.  When used through the marketplace functionality,
    # you may charge a commission fee for brokering the exchange.
    # 
    # Note that donation recipients must accept your marketplace fee policy before
    # the payment buttons for their donations may be generated.   This can be 
    # accomplished using the +MarketplacePolicy+ service with the form helper 
    # (see examples).
    # 
    # === Simple Pay Donation Fields
    # 
    # ==== Required Fields
    # 
    # The following attributes are required when generating a Simple Pay Donation
    # form (in addition to those listed in +SimplePay::Service+):
    # 
    # amount:: The dollar value you'd like to collect
    # 
    # ==== Optional Fields
    # 
    # immediate_return:: Immediately returns the customer to your +return_url+ directly after payment.
    # ipn_url:: Fully-qualified URL to which Amazon will POST instant payment notifications.
    # process_immediately:: Instructs Amazon to immediately process the payment.
    # reference_id:: A custom string your can set to identify this transaction, it will be returned with the IPNs and other returned data.
    # return_url:: Fully-qualified URL for where to send your customer following payment.
    # 
    # ===== Marketplace Fields
    # 
    # recipient_email:: The email address of the donation recipient (important and must be correct)
    # fixed_marketplace_fee::  The fixed marketplace fee to add to each transaction
    # variable_marketplace_fee:: The variable marketplace fee to add to each transaction
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
    #     <%= simplepay_form_for(:donation, {
    #       :amount                   => 34.95,
    #       :description              => "Mutual profit!",
    #       :recipient_email          => 'seller@gmail.com',
    #       :fixed_marketplace_fee    => 10.00,
    #       :variable_marketplace_fee => 5
    #     }) %>
    # 
    class Donation < Service

      required_field :access_key
      required_field :signature
      required_field :signature_method, :value => 'HmacSHA256'
      required_field :signature_version, :value => '2'
      

      required_field :description
      required_field :amount,               :class  => Support::Amount
      required_field :cobranding_style,     :value  => 'logo'
      required_field :donation_widget,      :as     => :is_donation_widget,
                                            :value  => '1'
      
      field :reference_id
      field :immediate_return,              :class  => Support::Boolean
      field :collect_shipping_address,      :class  => Support::Boolean
      field :process_immediately,           :class  => Support::Boolean,
                                            :as     => :process_immediate

      field :return_url
      field :ipn_url
      field :abandon_url
      
      # Marketplace inputs (recipient email required when using)
      field :fixed_marketplace_fee,         :class  => Support::Amount
      field :variable_marketplace_fee
      field :recipient_email
      
    end
    
  end
end
