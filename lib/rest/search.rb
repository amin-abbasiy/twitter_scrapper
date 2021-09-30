require 'json'
require 'typhoeus'
require 'byebug'
require_relative '../../initialize/app'

class Search
  attr_accessor :bearer_token, :query, :url, :search_type
  def initialize(url, search_type, bearer_token, query)
    @bearer_token = bearer_token
    @search_type = search_type || 'recent'
    @url = url || "https://api.twitter.com//2/tweets/search/#{@search_type}"
    @query = query || "Led Zeppelin OR Basketball OR Pizza OR Docker"
  end
  def execute
    @query_params = {
      "query": @query,
      "max_results": 10,
      # "start_time": "2020-07-01T00:00:00Z",
      # "end_time": "2020-07-02T18:00:00Z",
      # "expansions": "attachments.poll_ids,attachments.media_keys,author_id",
      "tweet.fields": @fields,
      "user.fields": @user_fileds
      # "media.fields": "url",
      # "place.fields": "country_code",
      # "poll.fields": "options"
    }
    options = {
      method: 'get',
      headers: {
        "User-Agent": "v2RecentSearchRuby",
        "Authorization": "Bearer #{@bearer_token}"
      },
      params: @query_params
    }

    request = Typhoeus::Request.new(@url, options)
    request.run
  end
end