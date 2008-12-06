module Simplepay
  module Services
  
    ##
    # The Amazon Simple Pay Standard service is used for one-time payments.
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