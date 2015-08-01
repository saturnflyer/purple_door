class TweetsController < ApplicationController
  def index

  end

  def show
    @tweets = Tweet.parse_tweets("@" + params[:handle])["tweets"].map do |t|
      t.gsub("\n", " ")
    end

    File.open("tweets.txt", "w+") do |f|
      f.puts(@tweets)
    end

    result = eval(`python tweet.py tweets.txt`)
    puts result
  end
end
