# TwitterScrapper

Welcome to `twitter_scrapper` lib. for getting data from twitter API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twitter_scrapper'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install twitter_scrapper

## Setup

first get to the database.yml and put there your db config

    $ bin/console 
    > Database.connect_and_create_db

## Usage
easiest way to use is run (set up database before):

    $ ruby lib/twitter_scrapper.rb search || stream

    $ ./console to quick start for using this lib

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amin-abbasiy/twitter_scrapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/amin-abbasiy/twitter_scrapper/twitter_scrapper/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TwitterScrapper project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/amin-abbasiy/twitter_scrapper/blob/master/CODE_OF_CONDUCT.md).
