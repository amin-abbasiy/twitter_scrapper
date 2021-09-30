RSpec.describe TwitterScrapper do
  let(:valid_data) {

  }
  let(:invalid_data) {

  }
  let(:search_client) {
    ::Twitter::REST::Client.new do |config|
        config.consumer_key        = '08eVz6MzaHQlXjWCaNsOnje3Z'
        config.consumer_secret     = 'gU3efQa34BEYPgs8THtYqsbXwHAYlj9gDRw4DfzXjcfvZ7VPny'
        config.access_token        = 'kWd0IWqRVQO6Mib4IKQMSVXb6zCUgYHFHyLgPKo'
        config.access_token_secret = 'adG2sEHxXjUifdfC2Ykfkk7jNaljE5yPlTijsq95cVGPE'
      end
  }
  let(:stream_client) {
    ::Twitter::Streaming::Client.new do |config|
      config.consumer_key        = '08eVz6MzaHQlXjWCaNsOnje3Z'
      config.consumer_secret     = 'gU3efQa34BEYPgs8THtYqsbXwHAYlj9gDRw4DfzXjcfvZ7VPny'
      config.access_token        = 'kWd0IWqRVQO6Mib4IKQMSVXb6zCUgYHFHyLgPKo'
      config.access_token_secret = 'adG2sEHxXjUifdfC2Ykfkk7jNaljE5yPlTijsq95cVGPE'
    end
  }
  it "has a version number" do
    expect(TwitterScrapper::VERSION).should_not be_nil
  end
  context "successful search" do
    it "search have results" do
      expect(TwitterScrapper::Scrape.new(TwitterScrapper::Search.new(search_client))).should_not be_nil
    end
    it "stream have results" do
      expect(TwitterScrapper::Scrape.new(TwitterScrapper::Stream.new(search_client))).not_to be_empty
    end
  end
  context "unsuccessful search" do

  end
end
