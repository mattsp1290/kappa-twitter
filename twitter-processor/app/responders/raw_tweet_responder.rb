class RawTweetResponder < ApplicationResponder
    topic :raw_tweet
  
    def respond(data)
      respond_to :raw_tweet, data
    end
end