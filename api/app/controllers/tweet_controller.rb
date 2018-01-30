class TweetController < ApplicationController
    def index
        @test = {a: 1, b: 2}
        render json: @test
    end
end
