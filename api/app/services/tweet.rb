module Tweet
    def self.get_tweet(request)
        uuid = request.uuid
        self.request_tweet(uuid)
        tweet = nil
        begin
            Timeout::timeout(5) {
                while true do
                    tweet = self.fetch_tweet(uuid)
                    break unless tweet.nil?
                end
            }
        rescue Timeout::Error
            puts "Timeout occurred while waiting for a tweet"
        end
        tweet
    end

    def self.request_tweet(uuid)
        tweet_request = {uuid: uuid, handle: nil}
        TweetResponder.call(tweet_request.to_json)
    end

    def self.fetch_tweet(uuid)
        $redis.get(uuid)
    end

    def self.tweet_from_params(params)
        {"full_text" => params[:full_text], "lang" => params[:lang], "source" => params[:source], "text" => params[:text], "user" => params[:user] }.to_json
    end
end