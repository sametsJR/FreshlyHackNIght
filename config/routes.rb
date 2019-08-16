Rails.application.routes.draw do
  devise_for :users

  resources :dishes
  resources :votes
end
