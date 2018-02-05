class TwitterRequestController < ApplicationController
    def consume
        if params[:uuid]
            unless params[:handle]
                tweets = []
                begin
                    Timeout::timeout(10) {
                        TwitterService.streaming_client.sample do |tweet|
                            tweets.push tweet if tweet.is_a?(Twitter::Tweet) and tweet.lang == 'en'
                            break if tweets.size > 10
                        end
                    }
                rescue Timeout::Error
                    puts "Timeout occurred while streaming tweets"
                end
                TwitterService.process_tweets(tweets)
                TwitterService.send_tweet(params[:uuid], tweets.last)
            end
        end
    end
end