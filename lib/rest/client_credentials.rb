require 'byebug'
require 'typhoeus'
require_relative '../../initialize/app'
class ClientCredential
  def initialize(api_key)
    @api_key = api_key
  end
  def get_token
    url = "https://api.twitter.com/oauth2/token"
    options = {
      headers: {
        Authorization: @api_key ,
         'Content-Type' => 'application/x-www-form-urlencoded;charset=UTF-8'},
      body: { grant_type: 'client_credentials' }
    }
    response = ::Typhoeus.post(url, options)
  end
end

api_key = ::APP::APP_FILE['TWITTER_CONSUMER_KEY']
ClientCredential.new(api_key).get_token