begin
  twitter_conf = YAML::load_file("#{Rails.root.to_s}/config/twitter.yml")[Rails.env]
  @twitter_client = TwitterHandler.connect(twitter_conf)
  Rails.logger.info 'Cool! Twitter client created successfully.'
rescue
  Rails.logger.error 'Whoops! Twitter client creation failed.'
end