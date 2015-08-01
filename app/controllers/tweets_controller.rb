class TweetsController < ApplicationController
  def index

  end

  def show
    @tweets = Tweet.parse_tweets("@" + params[:handle])["tweets"]
  end
end
