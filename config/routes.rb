Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
    resources :reviews
  end
  resources :categories
  root 'restaurants#index'
  get 'search', to: 'restaurants#search'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
