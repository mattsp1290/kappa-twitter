class TweetController < ApplicationController
    def index
        @test = {a: 1, b: 2}
        TweetResponder.call(@test)
        render json: @test
    end
end
