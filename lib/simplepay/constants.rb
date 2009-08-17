require 'simplepay/errors'
require 'simplepay/support/currency'

module Simplepay
  
  module Boolean
    True  = '1'
    False = '0'
  end
  
  module Interval
    Day   = 'day'
    Week  = 'week'
    Month = 'month'
    Year  = 'year'
  end
  
  Intervals = [Interval::Day, Interval::Week, Interval::Month, Interval::Year]

  ##
  # Amazon Status Codes (FPS Basic)
  #  SA  Success status for the ABT payment method.
  #  SB  Success status for the ACH (bank account) payment method.
  #  SC  Success status for the credit card payment method.
  #  SE  System error.
  #  A   Buyer abandoned the pipeline.
  #  CE  Specifies a caller exception.
  #  PE  Payment Method Mismatch Error: Specifies that the buyer does not have the payment method you requested.
  #  NP  This account type does not support the specified payment method.
  #  NM  You are not registered as a third-party caller to make this transaction. Contact Amazon Payments for more information.
  #
  module ResponseStatusCode
    SuccessfulABT             = 'SA'
    SuccessfulACH             = 'SB'
    SuccessfulCC              = 'SC'
    Abandoned                 = 'A'
    CallerException           = 'CE'
    PaymentMismatch           = 'PE'
    NotSupported              = 'NP'
    NotRegistered             = 'NM'
    
    # These haven't been verified so I'll leave them in for the time being
    HtmlError                 = 'ME'
    PaymentFailed             = 'PF'
    PaymentInitiated          = 'PI'
    PaymentReserved           = 'PR'
    PaymentSuccessful         = 'PS'
    SystemError               = 'SE'
    SubscriptionFailed        = 'SF'
    SubscriptionSuccessful    = 'SS'
    
    Successful  = [SuccessfulABT, SuccessfulACH, SuccessfulCC, PaymentSuccessful, SubscriptionSuccessful]
    Failure     = [Abandoned, CallerException, PaymentMismatch, NotSupported, NotRegistered, HtmlError, PaymentFailed, SystemError, SubscriptionFailed]
    Pending     = [PaymentInitiated, PaymentReserved]
    All         = [Successful, Failure, Pending].flatten
  end
  
  module Currency
    USD   = Support::Currency.new('United States Dollar', 'USD', "%0.2f")
  end
  
  Currencies = [Currency::USD]
  
end