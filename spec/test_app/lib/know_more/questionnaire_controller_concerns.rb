module KnowMore
  # this module is used to define the functions
  # that will actually run in the KnowMore/QuestionnaireController
  module QuestionnaireControllerConcerns
    self.included(base) do
      # define the behaviour when included
    end

    # _stepN function will be called by questionnaire#stepN
  
    def _step1
    end
  
    def _step2
    end
  
    def _step3
    end
  
  end
end