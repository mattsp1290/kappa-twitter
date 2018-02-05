class TweetResponder < ApplicationResponder
    topic :twitter_request
  
    def respond(data)
      respond_to :twitter_request, data
    end
  end
  