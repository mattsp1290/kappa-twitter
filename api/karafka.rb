# frozen_string_literal: true

# Non Ruby on Rails setup
# ENV['RACK_ENV'] ||= 'development'
# ENV['KARAFKA_ENV'] ||= ENV['RACK_ENV']
# Bundler.require(:default, ENV['KARAFKA_ENV'])
# Karafka::Loader.load(Karafka::App.root)

# Ruby on Rails setup
# Remove whole non-Rails setup that is above and uncomment the 4 lines below
ENV['RAILS_ENV'] ||= 'development'
ENV['KARAFKA_ENV'] = ENV['RAILS_ENV']
require ::File.expand_path('../config/environment', __FILE__)
Rails.application.eager_load!

class KarafkaApp < Karafka::App
  setup do |config|
    config.kafka.seed_brokers = %w[kafka://127.0.0.1:9092]
    config.client_id = 'example_app'
    config.backend = :inline
    config.batch_fetching = true
  end

  consumer_groups.draw do
    topic :twitter_request do
      controller TwitterRequestController
    end

    # consumer_group :bigger_group do
    #   topic :test do
    #     controller TestController
    #   end
    #
    #   topic :test2 do
    #     controller Test2Controller
    #   end
    # end
  end
end

KarafkaApp.boot!
