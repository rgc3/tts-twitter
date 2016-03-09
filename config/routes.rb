Rails.application.routes.draw do

  devise_for :users
  resources :relationships

  resources :tweets do
    resource :like
  end

  get "profiles/:id" => "profiles#show", as: :profile
  get "profiles" => "profiles#index"
  get "feed" => "profiles#feed"

  root "tweets#index"

end
