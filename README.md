# fist

fist is a simple TCP client gem for the [FIST](https://github.com/f-prime/fist) server. I wrote this to learn Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fist'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fist

## Usage

FIST is a great alternative to heavier text search servers like Elasticsearch when you
want to build toy projects and quick prototypes with basic search capabilities and zero
hassle of infrastructure management that a beast like ES brings to your project. The purpose
of writing this library was to bring this convinience into the Ruby world and also to learn Ruby.

```ruby
@client = Fist::FistClient.new("localhost", "5575")
@client.connect # connect to the server

@client.version # return the version of the FIST server

# index a document `doc` containing the string `some text`
@client.index("doc", "some text")

# search and return all the documents containing the string `text`
@client.search("text")

# delete all the documents containing the string `text`
@client.delete("text")

@client.close # close the connection
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

PRs and Issues are welcome.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
