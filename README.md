# Scrubber

Scrubber removes sensitive fields from json data.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add scrubber

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install scrubber

## Usage

```
scrubber sensitive_fields.txt input.json output.json
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

To test the CLI locally, run `bundle exec exe/scrubber` or install the gem with `rake install`


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
