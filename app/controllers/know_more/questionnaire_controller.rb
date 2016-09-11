require "#{Rails.root}/lib/know_more/questionnaire_controller_concerns.rb"

module KnowMore
  class QuestionnaireController < ApplicationController
    include QuestionnaireControllerConcerns

    KnowMore.config.pages.times do |n|
      step_index = n + 1
      define_method "step#{step_index}" do
        self.send("_step#{step_index}")
      end
    end
  end
end