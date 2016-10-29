KnowMore::Engine.routes.draw do
  KnowMore.config.pages.times do |n|

    get "/questionnaire/step#{n+1}", to: "questionnaire#step#{n+1}", as: "questionnaire_step#{n+1}"
    patch "/questionnaire/step#{n+1}", to: "questionnaire#step#{n+1}_update", as: "questionnaire_step#{n+1}_update"
  end
end
