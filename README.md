# Rspec custom matchers for Rails query counter [![Gem Version](https://badge.fury.io/rb/rspec-query-limit.png)](http://badge.fury.io/rb/rspec-query-limit)

## Features

- Prevent N+1 problem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-query-limit'
```

And then execute:
```bash
$ bundle
```

Support for rspec versions 2 and 3

## Usage

Add to your ```spec/spec_helper.rb```

```ruby
require 'rspec/query_limit'
```

And then you can use matchers
```ruby
describe UserEmails do
  describe '#primary_emails' do
    users = User.all
    expect { UserEmails.primary_emails(users) }.to query_limit_eq(2)
  end
end
```

## List of query limit matchers
Numbers of queries must be equal

```
query_limit_eq(number)
```

## Inspiration from
[Stackoverflow](http://stackoverflow.com/questions/5490411/counting-the-number-of-queries-performed)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
