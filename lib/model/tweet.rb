require 'sequel'
require 'logger'
require 'pg'
require 'byebug'
require_relative '../db/db.rb'
class InputError < StandardError; end
class Tweet
  class << self
    def new_flow
      last_flow ? (last_flow[:flow_id] + 1) : 1
    end
    def create(data)
      Tweet.new.validate_input(data)
      Database.connection[:tweets].insert(data)
    end
    def create_table(name = 'tweets')
      Database.connection.create_table name.to_sym do
        primary_key :id
        Integer :flow_id
        String :tweet_id
        String :description
        String :in_reply_to_status_id
        String :in_reply_to_user_id
        String :lang
        Integer :retweet_count
        Integer :favorite_count
        DateTime :tweet_created_at, null: false
        DateTime :created_at, null: false
        Boolean :truncated
        Boolean :retweeted
        Boolean :favorited
        # column :entities, :jsonb, null: false
        # column :user, :jsonb, null: false
      end
    end
    def all
      tweets = Database.connection.from(:tweets)
      tweets.all
    end
    def first
      Database.connection.from(:tweets).order(:id).first
    end
    def last
      Database.connection.from(:tweets).order(:id).last
    end
    def last_flow
      Database.connection.from(:tweets).order(:flow_id).last
    end
    def tweets
      Database.connection.from(:tweets)
    end
  end
  def validate_input(data)
    raise InputError, "Data Must Be Hash" unless data.is_a?(Hash)
    raise InputError, "Data Length is more" unless data.size > 2
    mandatories =  [:tweet_id, :description, :tweet_created_at, :created_at]
    raise InputError, "Data keys does not include necessary values" if (data.keys & mandatories).size != mandatories.size
  end
end




# DB = Sequel.connect(adapter: :postgres, user: 'user', password: 'password', host: 'host', port: port,
#                     database: 'database_name', max_connections: 10, logger: Logger.new('log/db.log')











data = {
  "data": [
    { "id": "1373001119480344583", "text": "Looking to get started with the Twitter API but new to APIs in general? @jessicagarson will walk you through everything you need to know in APIs 101 session. She’ll use examples using our v2 endpoints, Tuesday, March 23rd at 1 pm EST.nnJoin us on Twitchnhttps://t.co/GrtBOXyHmB" },
    {
      "id": "1372627771717869568",
      "text": "Thanks to everyone who joined and made today a great session! 🙌 nnIf weren't able to attend, we've got you covered. Academic researchers can now sign up for office hours for help using the new product track. See how you can sign up, here 👇nhttps://t.co/duIkd27lPx https://t.co/AP9YY4F8FG"
    },
    {
      "id": "1367519323925843968",
      "text": "Meet Aviary, a modern client for iOS 14 built using the new Twitter API. It has a beautiful UI and great widgets to keep you up to date with the latest Tweets. https://t.co/95cbd253jK"
    },
    {
      "id": "1366832168333234177",
      "text": "The new #TwitterAPI provides the ability to build the Tweet payload with the fields that you want. nnIn this tutorial @suhemparack explains how to build the new Tweet payload and how it compares with the old Tweet payload in v1.1 👇 https://t.co/eQZulq4Ik3"
    },
    {
      "id": "1364984313154916352",
      "text": "“I was heading to a design conference in New York and wanted to meet new people,” recalls @aaronykng, creator of @flocknet. “There wasn't an easy way to see all of the designers in my network, so I built one.” Making things like this opened the doors for him to the tech industry."
    },
    {
      "id": "1364275610764201984",
      "text": "If you're newly approved for the Academic Research product track, our next stream is for you.nnThis Thursday, February 25th at 10AM PST @suhemparack will demo how academics can use this track to get started with the new #TwitterAPInnJoin us on Twitch! 👀nhttps://t.co/SQziibOD9P"
    }
  ],
  "meta": {
    "newest_id": "1373001119480344583",
    "oldest_id": "1364275610764201984",
    "result_count": 6
  }
}
