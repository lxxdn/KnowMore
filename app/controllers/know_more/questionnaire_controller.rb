require "#{Rails.root}/app/controllers/concerns/know_more/questionnaire_controller_concerns.rb"

module KnowMore
  class QuestionnaireController < ::ApplicationController
    include QuestionnaireControllerConcerns

    KnowMore.config.pages.times do |n|
      step_index = n + 1

      # define the new methods
      define_method "step#{step_index}" do
        self.send("_step#{step_index}")
        render "know_more/questionnaire/step#{step_index}"
      end

      # define the update methods
      define_method "step#{step_index}_update" do
        self.send("_step#{step_index}_update")

        if params[:direction] == 'previous'
          i = step_index - 1
          redirect_to self.send("questionnaire_step#{i}") if i > 0
        else # default is go to the next page
          i = step_index + 1
          redirect_to self.send("questionnaire_step#{i}") if i <= KnowMore.config.pages
        end
      end
    end
  end
end
