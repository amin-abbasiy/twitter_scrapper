require_relative '../initialize/app'
require 'twitter'
config_data = APP::APP_FILE

CLIENT = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY", config_data['TWITTER_CONSUMER_KEY'])
    config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET", config_data['TWITTER_CONSUMER_SECRET'])
    config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN", config_data['TWITTER_ACCESS_TOKEN'])
    config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET", config_data['TWITTER_ACCESS_SECRET'])
end

REST_CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY", config_data['TWITTER_CONSUMER_KEY'])
    config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET", config_data['TWITTER_CONSUMER_SECRET'])
    config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN", config_data['TWITTER_ACCESS_TOKEN'])
    config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET", config_data['TWITTER_ACCESS_SECRET'])
end

