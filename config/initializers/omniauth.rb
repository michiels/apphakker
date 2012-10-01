if Rails.env.test?
  OmniAuth.config.test_mode = true
end