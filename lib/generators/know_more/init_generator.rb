require 'rails/generators/base'

module KnowMore
  class InitGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc 'Generate initializer'

    def copy_initializer
      template 'initializer.rb.erb', 'config/initializers/know_more.rb'
    end
  end
end

