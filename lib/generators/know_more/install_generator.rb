require 'rails/generators/base'

module KnowMore
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)
    desc "Create views, migration and model for Rails application"

    def copy_views
      puts "copy views..."
    end

    def copy_migration
      puts 'copy migration'
    end
    def copy_model
      puts 'copy model'
    end
  end
end

