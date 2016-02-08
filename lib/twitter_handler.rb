module TwitterHandler
  def self.connect(twitter_conf)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = twitter_conf['key']
      config.consumer_secret     = twitter_conf['secret']
      config.access_token        = twitter_conf['token']
      config.access_token_secret = twitter_conf['token_secret']
    end
    client
  end
end