class RequestedTweetConsumer < ApplicationConsumer
    def consume
        puts "=============="
        puts "consuming"
        puts "=============="
        tweet = Tweet.tweet_from_params(params)
        $redis.set(params[:uuid], tweet)
    end
end
