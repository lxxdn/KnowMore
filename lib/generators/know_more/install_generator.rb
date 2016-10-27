require 'rails/generators/base'

module KnowMore
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    class_option :haml, :desc => 'Generate Haml pages instead of erb', :type => :boolean
    # class_option :slim, :desc => 'Generate Slim pages instead of erb', :type => :boolean

    argument :model_name

    desc 'Create views, migration and model for Rails application'

    def before_all
      @model_name = model_name.underscore
    end

    def copy_views
      KnowMore.config.pages.times do |n|
        @n = n+1
        copy_template
      end
    end

    def copy_concerns
      template 'concerns.rb.erb', 'app/controllers/concerns/know_more/questionnaire_controller_concerns.rb'
    end

    def generate_model
      template 'models/model.rb.erb', "app/models/#{@model_name}.rb"
    end

    def generate_migration
      template 'models/migration.rb.erb', "db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_#{model_name}.rb"
    end

    private
    def copy_template
      template_engine = 'erb'
      if options.haml?
        template_engine = 'haml'
      end
      template "#{template_engine}/page_template.erb", "app/views/know_more/questionnaire/step#{@n}.html.#{template_engine}"
    end
  end
end
