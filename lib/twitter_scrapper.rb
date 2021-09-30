require_relative '../initialize/twitter.rb'
require_relative "twitter_scrapper/version"
require_relative 'model/tweet'
require_relative 'helpers'
require 'byebug'
module TwitterScrapper
  class UnknownInputError < StandardError; end
  class Scrape
    attr_accessor :real_object
    def initialize(real_object)
      @real_object = real_object
    end
    def execute
      @real_object.execute
    end
  end
  class Search
    attr_accessor :clinet
    include ::Helpers
    def initialize(client)
      @client = client
    end
    def execute
      helper = self.extend(ClassMethods)
      #create flow if app restarted of finished fetching data from api to do not lose last state
      new_flow_id = ::Tweet.new_flow
      last_started_monitor = ::Tweet.tweets.where(flow_id: ::Tweet.last_flow[:flow_id] || 1).first[:tweet_id] if ::Tweet.last_flow
      last_started_monitor ||= 1
      #make options for search bass of exact keywords
      query = "Basketball OR Led%20Zeppelin OR Pizza OR Docker"
      #set options for request
      options = { result_type: "recent", since_id: last_started_monitor } unless last_started_monitor.nil? && last_started_monitor == false
      options ||= { result_type: "recent" }
      @client.search(query, options).collect do |tweet|
        helper.time_limitation_holder
        puts "#{tweet.user.name} Says: #{tweet.text}"
        puts tweet.created_at
        puts "Found........."
        helper.log_data(tweet)
        ::Tweet.create(helper.organizer(tweet).merge(flow_id: new_flow_id, created_at: Time.now))
      end
    end
  end
  class Stream
    attr_accessor :client
    include ::Helpers
    def initialize(client)
      @client = client
    end
    def execute
      helper = self.extend(ClassMethods)
      subjects = ["Led Zeppelin", "Basketball", "Pizza", "Docker"]
      new_flow_id = ::Tweet.new_flow
      @client.filter(track: subjects.join(",")) do |object|
        if object.is_a?(Twitter::Tweet)
          helper.time_limitation_holder
          puts object.text
          puts object.id
          puts object.created_at
          puts "Streaming...."
          helper.log_data(object)
          ::Tweet.create(helper.organizer(object).merge(flow_id: new_flow_id, created_at: Time.now))
        end
      end
    end
  end
end
raise TwitterScrapper::UnknownInputError, "please enter search or stream" unless ARGV[0] == 'search' || ARGV[0] == 'stream'
TwitterScrapper::Scrape.new(TwitterScrapper::Search.new(REST_CLIENT)).execute if ARGV[0] == "search"
TwitterScrapper::Scrape.new(TwitterScrapper::Stream.new(CLIENT)).execute if ARGV[0] == "stream"
