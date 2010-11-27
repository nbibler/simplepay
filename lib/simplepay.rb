$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'active_support'

module Simplepay
  
  VERSION = '0.2.2' unless const_defined?(:VERSION)

  attr_accessor :aws_access_key_id
  attr_accessor :aws_secret_access_key
  attr_accessor :account_id

  attr_accessor :use_sandbox
  @@use_sandbox = true

  def self.use_sandbox?
    @@use_sandbox
  end

end

require 'simplepay/constants'
require 'simplepay/support'
require 'simplepay/authentication'
require 'simplepay/service'
require 'simplepay/helpers/form_helper'
