require 'rails/generators/base'

module KnowMore
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    class_option :haml, :desc => 'Generate Haml pages instead of erb', :type => :boolean
    # class_option :slim, :desc => 'Generate Slim pages instead of erb', :type => :boolean

    desc 'Create views, migration and model for Rails application'

    def copy_views
      KnowMore.config.pages.times do |n|
        @n = n+1
        copy_template
      end
    end

    def copy_concerns
      template 'concerns.rb.erb', 'lib/know_more/questionnaire_controller_concerns.rb'
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