require "twitter"
TWEET_COUNT = 100

class TwitterRestApi
  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV.fetch("twitter_consumer_key")
      config.consumer_secret = ENV.fetch("twitter_consumer_secret")
    end
  end

  def search_by_user(user)
    client.user_timeline(user, count: TWEET_COUNT)
  end
end
