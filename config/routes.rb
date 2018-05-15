Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get 'decks/new'
  get 'decks/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
