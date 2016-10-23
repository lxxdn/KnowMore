KnowMore::Engine.routes.draw do
  KnowMore.config.pages.times do |n|

    get "/questionnaire/step#{n+1}", to: "questionnaire#setp#{n+1}_new", as: "questionnaire_step#{n+1}_new"
    post "/questionnaire/step#{n+1}", to: "questionnaire#setp#{n+1}_update", as: "questionnaire_step#{n+1}_update"
  end
end
