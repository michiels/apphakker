ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'sidekiq/testing/inline'

OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  :provider => 'github',
  :uid => '12345',
  :extra => {
    :raw_info => {
      :name => "Michiel Sikkes",
      :email => "michiel.sikkes@gmail.com"
    },
  }
})

OmniAuth.config.mock_auth[:existing] = OmniAuth::AuthHash.new({
  :provider => 'github',
  :uid => '55555',
  :extra => {
    :raw_info => {
      :name => "Michiel Sikkes",
      :email => "michiel@firmhouse.com"
    },
  }
})

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end