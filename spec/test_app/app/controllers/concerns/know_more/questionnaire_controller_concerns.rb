module KnowMore
  # this module is used to define the functions
  # that will actually run in the KnowMore/QuestionnaireController
  module QuestionnaireControllerConcerns
    def self.included(base)
      # define the behaviour when included
      base.before_action :set_questionnaire
    end

    # _stepN function will be called by questionnaire#stepN

    def _step1
    end

    def _step1_update
      @questionnaire.update(questionnaire_params)
    end

    def _step2
    end

    def _step2_update
      @questionnaire.update(questionnaire_params)
    end

    def _step3
    end

    def _step3_update
      @questionnaire.update(questionnaire_params)
    end

    private
    def set_questionnaire
      @questionnaire = current_questionnaire
    end

    def questionnaire_params
      params.require(:questionnaire).permit(:attribute1, :attribute2, :attribute3)
    end
  end
end
