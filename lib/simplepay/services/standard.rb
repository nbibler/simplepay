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

      # common service fields
      required_field :signature, :as => :aws_signature
      required_field :access_key, :as => :caller_key
      required_field :pipeline_name, :value => 'SingleUse' # Valid Values: SingleUse | MultiUse | Recurring | Recipient | SetupPrepaid | SetupPostpaid | EditToken
      required_field :return_url
      required_field :version, :value => '2009-01-09'

      field :cobranding_style, :value => 'logo'
      field :cobranding_url
      field :website_description

      # standard service fields
      required_field :reference_id, :as => 'callerReference'
      required_field :transaction_amount, :class => Support::SimpleAmount
      
      field :address_name
      field :address_line1
      field :address_line2
      field :city
      field :state
      field :zip
      field :phone_number
      field :collect_shipping_address, :class => Support::Boolean
      field :currency_code, :value => "USD"
      field :discount
      field :gift_wrapping
      field :handling, :class => Support::SimpleAmount
      field :item_total, :class => Support::SimpleAmount
      field :payment_method
      field :payment_reason
      field :reserve
      field :shipping, :class => Support::SimpleAmount
      field :tax, :class => Support::SimpleAmount
      field :ipn_url
      
    end
    
  end
end