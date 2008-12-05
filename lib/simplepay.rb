$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'active_support'

require 'simplepay/constants'
require 'simplepay/support'
require 'simplepay/service'
require 'simplepay/services/subscription'

require 'simplepay/helpers/form_helper'

module Simplepay
  
  VERSION = '0.0.1'

  mattr_accessor :html_tag_terminator
  @@html_tag_terminator = '/'

  mattr_accessor :access_key_id
  mattr_accessor :secret_access_key

  mattr_accessor :use_sandbox
  @@use_sandbox = true


  def self.use_sandbox?
    @@use_sandbox
  end

end
