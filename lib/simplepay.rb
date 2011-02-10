$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
begin
  require 'active_support/hash_with_indifferent_access'
  require 'active_support/core_ext/string/inflections'
  require 'active_support/core_ext/object/blank'
  require 'active_support/core_ext/module/attribute_accessors'
  require 'active_support/core_ext/module/hash_keys'
  require 'active_support/callbacks'
  require 'active_support/inflector'
rescue LoadError
  # support older versions of active_support
  require "active_support"
end

module Simplepay
  
  VERSION = '0.2.3' unless const_defined?(:VERSION)

  mattr_accessor :aws_access_key_id
  @@aws_access_key_id = '' 
  mattr_accessor :aws_secret_access_key
  @@aws_secret_access_key = ''  
  mattr_accessor :use_sandbox
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
