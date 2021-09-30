require_relative '../initialize/app'
module Helpers
  def included(klass)
    klass.extend ClassMethods
  end
  module ClassMethods
    def organizer(object)
      hash_data = object.to_h
      data = {
        tweet_id:              hash_data[:id],
        description:           hash_data[:text],
        in_reply_to_status_id: hash_data[:in_reply_to_status_id],
        in_reply_to_user_id:   hash_data[:in_reply_to_user_id],
        lang:                  hash_data[:lang],
        retweet_count:         hash_data[:retweet_count],
        favorite_count:        hash_data[:favorite_count],
        tweet_created_at:      hash_data[:created_at],
        truncated:             hash_data[:truncated],
        retweeted:             hash_data[:retweeted],
        favorited:             hash_data[:favorited]
      }
    end
    def time_limitation_holder
      config_data = ::APP::APP_FILE
      limit_rate = ENV.fetch('RATE_LIMIT', config_data['RATE_LIMIT'])
      time = ENV.fetch('MINUTES',  config_data['MINUTES']) * 60
      run_per_seconds = time / limit_rate
      sleep run_per_seconds
    end
    def log_data(object)
      APP::LOGGER.info("#{object.user.name} Says: #{object.text} DATE: #{object.created_at}")
    end
  end
end