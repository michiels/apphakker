Apphakker::Application.routes.draw do
  get "dashboard/index"

  resources :achievements do
    member do
      post :claim
    end
  end

  devise_for :players, :controllers => { :omniauth_callbacks => "players/omniauth_callbacks"}

  devise_scope :player do
    get '/players/auth/github' => 'users/omniauth_callbacks#github'
    get 'sign_in', :to => 'home#index', :as => :new_player_session
    get 'sign_in', :to => 'home#index', :as => :new_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_session
  end

  root :to => "home#index"
end
