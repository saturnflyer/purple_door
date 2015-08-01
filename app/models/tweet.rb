class Tweet
  def self.service
    @service ||= TwitterRestApi.new
  end

  def self.parse_tweets(user="@BarackObama")
    tweets = grab_user_tweets(user)

    og_tweets   = []

    tweets.each do |t|
      og_tweets << t.text
    end

    hash = {}
    hash["username"]   = user
    hash["tweets"]     = og_tweets

    hash
  end

  def self.grab_user_tweets(user)
    service.search_by_user(user)
  end
end
