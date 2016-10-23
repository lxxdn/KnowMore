module KnowMore
  module ControllerHelpers
    def current_questionnaire
      raise 'You must implement current_questionnaire in your controller'
    end

    def require_questionnaire!
      return if current_questionnaire.nil?
      unless current_questionnaire.done?
        current_questionnaire.progress
        redirect_to know_more.send("questionnaire_#{current_questionnaire.progress.to_s}_url")
      end
    end
  end
end