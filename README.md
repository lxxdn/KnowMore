# KnowMore

This gem aims to provide a general questionnaire scaffold, with which you can quickly make you own questionnaire page.

## Installation

This is a Rails-based gem. It can only work with you Rails application.
Add this line to your application's Gemfile:

```ruby
gem 'know_more'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install know_more
```

## Usage
How to use my plugin.

```sh
rails g know_more:init
```

This will generate a initializer file, where you can config the questionnaire steps and the url to go when questionnaire is finished

Configure the the initializer file `config/initializers/know\_more.rb`

Then run the install generator, which will give you templates, controller concerns, model and migration file.
 
```sh
rails g know_more:install MODEL 
```
This will generate template with erb engine, you can use `--haml` to generate haml template

The argument MODEL indicates the questionnaire model name

It will also create a migration, you can add other attribute to this migration

### What the generated files used for
1. `app/controllers/concerns/know_more/questionnaire_controller_concerns.rb`
    
    This file is included by the QuestionnaireController(in the gem), you can add the behaviour
    that you want to do in each step
    
    Here is an example:
    ```rb
     
    module KnowMore
      # this module is used to define the functions
      # that will actually run in the KnowMore/QuestionnaireController
      module QuestionnaireControllerConcerns
        def self.included(base)
          # define the behaviour when included
          base.before_action :set_questionnaire
        end

        # _stepN function will be called by questionnaire#stepN

        def _step1
        end

        def _step1_update
          @questionnaire.update(questionnaire_params)
        end

        def _step2
        end

        def _step2_update
          @questionnaire.update(questionnaire_params)
        end

        private
        def set_questionnaire
          @questionnaire = current_questionnaire
        end

        def questionnaire_params
          params.require(:questionnaire).permit(:attribute1, :attribute2, :attribute3)
        end
      end
    end
    ```
2. `app/models/MODEL.rb`
    This is the questionnaire model, it has an attribute progress which records which step the client was on.
    Cooperating with `require_questionnaire!`, you can force your client to continue with the previous questionnaire.

Then include the module KnowMore::ControllerHelpers into your ApplicationController or BaseController
and implement your own `current_questionnaire` 

```rb
class ApplicationController < ActionController::Base 
  include KnowMore::ControllerHelpers
  
  def current_questionnaire
    # your implementation
  end
end
```

### Notice 

1. The questionnaire returned by current_questionnaire should be created at first.
Because the process of doing questionnaire is only editing
 
2. In the `KnowMore::ControllerHelpers`, it provide a helper function `require_questionnaire!`, it could force user to finish questionnaire before going to a controller
 by redirecting the user to the last step of the questionnaire
```rb
before_action :require_questionnaire!
```

## Todo

1. add welcome page configuration
2. allow copy the controller to user app so that user can modify the questionnaire controller
4. support rename step


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
