Rails.application.routes.draw do
  resources :epitaphs do
    post 'write', on: :new
    get 'write', on: :new
  end
  get 'home/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  root to: "high_voltage/pages#show", id: 'teaser'
end
