require 'simplepay/helpers/rails_helper'
require 'simplepay/helpers/notification_helper'

# Inject helper into Rails ActionView.
ActionView::Base.__send__(:include, Simplepay::Helpers::RailsHelper)
