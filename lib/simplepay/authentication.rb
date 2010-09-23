require 'openssl'
require 'base64'
require 'uri'
require 'cgi'

module Simplepay

  class Signature

    def initialize(uri, params, secret_key = Simplepay.aws_secret_access_key)
      @uri = uri
      @params = params
      @secret_key = secret_key
    end

    def sign
      make_canonical_string
      compute_signature
    end

    private

    def compute_signature
      digest = OpenSSL::Digest::Digest.new('sha256')
      Base64.encode64(OpenSSL::HMAC.digest(digest, @secret_key, @canonical)).chomp
    end

    def make_canonical_string
      @canonical = "POST\n#{@uri.host}\n#{@uri.path}\n"
      params = @params.reject{|k,v| v.blank? }.inject({}) { |a, (k,v)| a[k.to_s] = v; a }
      params = params.sort.inject([]) { |a, v| a << urlencode(v[0]) + '=' + urlencode(v[1]) }.join('&')
      @canonical += params
    end

    def urlencode(plaintext)
      CGI.escape(plaintext.to_s).gsub('+', '%20').gsub('%7E', '~')
    end

  end

end