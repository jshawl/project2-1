Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["twitter_key"], ENV["twitter_secret"]
  # Excellent job using environment variables for sensitive info
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_id'], ENV['facebook_secret'] 
end
