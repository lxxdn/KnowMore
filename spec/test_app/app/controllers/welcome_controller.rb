class WelcomeController < ApplicationController
  before_action :require_questionnaire!
  def hello
  end
end
