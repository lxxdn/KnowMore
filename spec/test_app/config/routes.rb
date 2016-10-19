Rails.application.routes.draw do
  mount KnowMore::Engine => "/know_more"

  root to: 'welcome#hello'
end
