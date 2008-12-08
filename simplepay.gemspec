# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simplepay}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathaniel E. Bibler"]
  s.cert_chain = ["/Users/nathan/.gem/gem-public_cert.pem"]
  s.date = %q{2008-12-08}
  s.description = %q{This gem provides a Rails interface to the Amazon Simple Pay payment service.}
  s.email = ["gem@nathanielbibler.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "config/website.yml", "lib/simplepay.rb", "lib/simplepay/authentication.rb", "lib/simplepay/constants.rb", "lib/simplepay/errors.rb", "lib/simplepay/helpers/form_helper.rb", "lib/simplepay/helpers/rails_helper.rb", "lib/simplepay/service.rb", "lib/simplepay/services/standard.rb", "lib/simplepay/services/subscription.rb", "lib/simplepay/support.rb", "lib/simplepay/support/amount.rb", "lib/simplepay/support/billing_frequency.rb", "lib/simplepay/support/boolean.rb", "lib/simplepay/support/currency.rb", "lib/simplepay/support/epoch.rb", "lib/simplepay/support/field.rb", "lib/simplepay/support/interval.rb", "lib/simplepay/support/subscription_period.rb", "script/console", "script/destroy", "script/generate", "simplepay.gemspec", "test/simplepay/services/test_standard.rb", "test/simplepay/services/test_subscription.rb", "test/simplepay/support/test_amount.rb", "test/simplepay/support/test_billing_frequency.rb", "test/simplepay/support/test_boolean.rb", "test/simplepay/support/test_epoch.rb", "test/simplepay/support/test_field.rb", "test/simplepay/support/test_interval.rb", "test/simplepay/support/test_subscription_period.rb", "test/simplepay/test_authentication.rb", "test/simplepay/test_service.rb", "test/test_helper.rb", "test/test_simplepay.rb", "website/default.css", "website/images/img01.gif", "website/images/img02.gif", "website/images/img03.gif", "website/images/img04.gif", "website/images/spacer.gif", "website/index.html"]
  s.has_rdoc = true
  s.homepage = %q{http://simplepay.rubyforge.org}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{simplepay}
  s.rubygems_version = %q{1.3.1}
  s.signing_key = %q{/Users/nathan/.gem/gem-private_key.pem}
  s.summary = %q{This gem provides a Rails interface to the Amazon Simple Pay payment service.}
  s.test_files = ["test/simplepay/services/test_standard.rb", "test/simplepay/services/test_subscription.rb", "test/simplepay/support/test_amount.rb", "test/simplepay/support/test_billing_frequency.rb", "test/simplepay/support/test_boolean.rb", "test/simplepay/support/test_epoch.rb", "test/simplepay/support/test_field.rb", "test/simplepay/support/test_interval.rb", "test/simplepay/support/test_subscription_period.rb", "test/simplepay/test_authentication.rb", "test/simplepay/test_service.rb", "test/test_helper.rb", "test/test_simplepay.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_development_dependency(%q<newgem>, [">= 1.1.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_dependency(%q<newgem>, [">= 1.1.0"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.0.2"])
    s.add_dependency(%q<newgem>, [">= 1.1.0"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
