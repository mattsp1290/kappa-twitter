class TwitterRequestController < ApplicationController
    def consume(data)
        puts data.to_s
    end
end