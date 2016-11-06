module KnowMore
  class Engine < ::Rails::Engine
    isolate_namespace KnowMore

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer 'know_more.route' do |app|
      app.routes.append do
        mount KnowMore::Engine => "/know_more", as: 'know_more'
      end
    end
  end
end
