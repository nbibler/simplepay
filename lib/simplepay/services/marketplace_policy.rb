module Simplepay
  module Services
  
    ##
    # The Amazon Simple Pay Marketplace Policy service is used to allow sellers to acknowledge marketplace policy fees.
    # Only once a set policy has been agreed to will marketplace transactions be able to proceed.
    #
    # === Simple Pay Marketplace Policy Fields
    # 
    # ==== Required Fields
    # 
    # The following attributes are required when creating a Simple Pay Marketplace policy fee acceptance form
    # (in addition to those listed in +Simplepay::Service+):
    # 
    # max_fixed_fee:: The maximum fixed fee that will be appended to transactions.
    # max_variable_fee:: The maximum variable fee (%) that will be calculated and added to transactions.
    # return_url:: Fully-qualified URL for where to send they buyer following payment.
    # reference_id:: A custom string used to identify this transaction, it will be returned with return data.
    #
    # === Example
    # 
    #     (in your view, using the form helper)
    #
    #     <%= simplepay_form_for(:marketplace_policy, {
    #       :max_fixed_fee => 10.00,
    #       :max_variable_fee => 5,
    #       :return_url => 'http://yourservice.com',
    #       :reference_id => '123456789'
    #     }) %>
    #
    class MarketplacePolicy < Service
      
      required_field :access_key, :as => :caller_key
      required_field :signature,  :as => :aws_signature
      required_field :account_id, :as => :caller_account_id
      required_field :signature_method, :value => 'HmacSHA256'
      required_field :signature_version, :value => '2'
      
      
      required_field :max_fixed_fee
      required_field :max_variable_fee
      required_field :return_url

      required_field :reference_id,          :as => :caller_reference
      required_field :collect_email_address, :value => 'True'
      required_field :pipeline_name,         :value => 'Recipient'

      # These fields are not currently utilized by the service
      required_field :recipient_pays_fee,    :value => 'True'
      
    end
    
  end
end
