class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include KnowMore::ControllerHelpers

  def current_questionnaire
    @current_questionnaire ||= Questionnaire.new
  end
end
