[![Build Status](https://travis-ci.org/kjakub/swanest.svg?branch=master)](https://travis-ci.org/kjakub/swanest)

# Swanest ruby wrapper (WIP)
 
A Ruby wrapper for the [Swanest](https://swanest.com/) API
*ruby code design inspired from angel list gem*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swanest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install swanest

## Configure

```ruby
Swanest.configure do |conf|
  conf.client_id = ""
  conf.client_secret = ""
end
```

## Scenario 1
from client i want to login to swanest
```ruby
Swanest.app_login
```
will login with `:scope => "identity:create"` and `:grant_type=>"client_credentials"`and return **access_token** valid for 1h
if you wish to login with another scope and to another default url you can override  
```ruby
Swanest.app_login({scope: "another scope"},{url: "another url"})
```
## Scenario 2
from client i want to create user in swanest
```ruby
Swanest.new.create_user({partnerId:"your internal id"},{}, access_token)
```
**access_token** is not required, and if not supplied it will use `Swanest.app_login` by default 

will create user with default params as follows
```ruby
default_params = {
  :country => 'BE',
  :language => 'en',
  :partnerId => params.fetch(:partnerId),
  :primaryCurrency => 'EUR'
}
```
custom params is allowed of course



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/swanest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Swanest project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/swanest/blob/master/CODE_OF_CONDUCT.md).
