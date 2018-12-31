# Rupology

Repology API v1 client library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rupology'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rupology

## Usage

```ruby
require 'rupology/client'

client = Rupology::Client.new

result = client.metapackage('ruby')

p result[0]['name'] # 'ruby2.5'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fd00/rupology.
