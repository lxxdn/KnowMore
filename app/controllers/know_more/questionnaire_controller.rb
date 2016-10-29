require "#{Rails.root}/app/controllers/concerns/know_more/questionnaire_controller_concerns.rb"

module KnowMore
  class QuestionnaireController < ::ApplicationController
    include QuestionnaireControllerConcerns

    KnowMore.config.pages.times do |n|
      step_index = n + 1

      # define the new methods
      define_method "step#{step_index}" do
        set_current_status(step_index) if current_questionnaire.progress != "step#{step_index}"
        self.send("_step#{step_index}")
        render "know_more/questionnaire/step#{step_index}"
      end

      # define the update methods
      define_method "step#{step_index}_update" do
        self.send("_step#{step_index}_update")

        if params[:direction] == 'previous'
          i = step_index - 1
          redirect_to self.send("questionnaire_step#{i}_url"), status: :see_other if i > 0
        else # default is go to the next page
          i = step_index + 1
          redirect_to self.send("questionnaire_step#{i}_url"), status: :see_other if i <= KnowMore.config.pages
        end
      end
    end

    def set_current_status(n)
      current_questionnaire.send("step#{n}!")
    end
    def set_next_status
      unless current_questionnaire.done?
        current_questionnaire.progress = ::Questionnaire.progresses[current_questionnaire.progress] + 1
        current_questionnaire.save
      end
    end

    def set_previous_status
      if ::Questionnaire.progresses[current_questionnaire.progress] > 0
        current_questionnaire.progress = ::Questionnaire.progresses[current_questionnaire.progress] -1
        current_questionnaire.save
      end
    end
  end
end
