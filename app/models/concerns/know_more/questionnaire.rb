module KnowMore
  module Questionnaire
    def self.included(base)
      base.enum progress: (1..KnowMore.config.pages).map{|n| "step#{n}".to_sym}.append(:done)
    end
  end
end