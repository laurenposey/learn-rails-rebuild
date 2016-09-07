Rails.application.routes.draw do
  resources :courses do
    resources :weeks
  end
  resources :weeks do
    resources :lessons
  end
end
