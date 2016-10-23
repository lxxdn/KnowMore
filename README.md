# KnowMore
Short description and motivation.

## Usage
How to use my plugin.

```sh
rails g know_more:init
```

configure the know\_more.rb file

```sh
rails g know_more:install MODEL 
```
This will generate template with erb engine, you can use --haml to generate haml template

The argument MODEL indicates the questionnaire name
It will also create a migration, you can add other attribute to this migration

Then include the module KnowMore::ControllerHelpers into your ApplicationController
and implement your own `current_questionnaire` 

```rb
class ApplicationController < ActionController::Base 
  include KnowMore::controllerHelpers
  
  def current_questionnaire
    # your implementation
  end
end
```

It will generate step1 - stepn template and
a concern where we define what the questionnaire controller will do



## Installation
Add this line to your application's Gemfile:

```ruby
gem 'know_more'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install know_more
```

## Todo

1. test the basic function
2. add welcome page
3. force user to finish questionnaire before leave
3. copy the controller to user app
4. support rename step


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
