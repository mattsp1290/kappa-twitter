class RequestedTweetResponder < ApplicationResponder
    topic :requested_tweet
  
    def respond(data)
      respond_to :requested_tweet, data
    end
end