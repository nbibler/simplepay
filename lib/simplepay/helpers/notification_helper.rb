require 'cgi'
require 'open-uri'

module Simplepay
  module Helpers
    
    ##
    # Adds a +valid_simplepay_request?+ method to your ActionControllers.
    # 
    # In order to use this, you should just directly hand your +params+ into
    # the method:
    # 
    #     class FooController < ApplicationController
    #     
    #       def receive_ipn
    #         if valid_simplepay_request?(params)
    #           ... record something useful ...
    #         else
    #           ... maybe log a bad request? ...
    #         end
    #       end
    #     
    #     end
    # 
    module NotificationHelper
      
      protected
      
      
      ##
      # Authenticates the incoming request by validating the +signature+ 
      # provided.
      # 
      #     (from within your controller)
      #     def receive_ipn
      #       if valid_simplepay_request?(params)
      #         ...
      #       end
      #     end
      # 
      def valid_simplepay_request?(endpoint, query)
        url = Simplepay.use_sandbox ? 'https://fps.sandbox.amazonaws.com' : 'https://fps.amazonaws.com'
        endpoint = CGI.escape(endpoint)
        query = CGI.escape(query)

        url_and_query = url + "/?Action=VerifySignature&Version=2008-09-17&UrlEndPoint=#{endpoint}&HttpParameters=#{query}"
        result = open(url_and_query) rescue false
        result.read =~ /Success/ ? true : false
      end

    end

  end
end
