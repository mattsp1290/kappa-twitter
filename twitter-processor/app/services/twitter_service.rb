require 'twitter'
require 'json'

class TwitterService
    @client = nil
    @streaming_client = nil

    def self.client
        unless @client
        end
        @client
    end

    def self.streaming_client
        unless @streaming_client
            @streaming_client = Twitter::Streaming::Client.new do |config|
                config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
                config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
                config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
                config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
              end
        end
        @streaming_client
    end

    def self.tweet_to_hash(tweet)
        {full_test: tweet.full_text, lang: tweet.lang, source: tweet.source, text: tweet.text, user: tweet.user }
    end

    def self.process_tweets(tweets)
        tweets.each do |tweet|
            RawTweetResponder.call(self.tweet_to_hash(tweet).to_json)
        end

    end

    def self.send_tweet(uuid, tweet)
        tweet = self.tweet_to_hash(tweet)
        tweet[:uuid] = uuid
        RequestedTweetResponder.call(tweet.to_json)
    end
end