KnowMore::Engine.routes.draw do
  KnowMore.config.pages.times do |n|
    post "/questionnaire/step#{n+1}", to: "questionnaire#setp#{n+1}", as: "questionnaire_step#{n+1}"
  end
end
