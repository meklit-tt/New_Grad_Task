Rails.application.routes.draw do
  get 'users/show'
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users
  resources :restaurants do
    resources :reviews
  end
  resources :categories
  root 'restaurants#index'
  get 'search', to: 'restaurants#search'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
