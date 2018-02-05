class TweetController < ApplicationController
    def index
        render json: Tweet.get_tweet(request)
    end
end
