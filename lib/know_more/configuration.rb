module KnowMore
  class Configuration
    include Singleton
    attr_accessor :pages

    # the url when finish the questionnaire
    attr_accessor :redirect_url
  end
end
