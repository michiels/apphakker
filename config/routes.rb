Apphakker::Application.routes.draw do
  get "players/update"

  resources :assignment_sets, :path => "sets"

  get "dashboard" => "dashboard#index", :as => :dashboard
  
  get "signout" => "sessions#destroy", :as => :signout

  resources :achievements do
    member do
      post :claim
    end
  end

  resource :player, defaults: {format: :js}

  devise_for :players, :controllers => { :omniauth_callbacks => "players/omniauth_callbacks"}

  devise_scope :player do
    get '/players/auth/github' => 'users/omniauth_callbacks#github'
    get 'sign_in', :to => 'home#index', :as => :new_player_session
    get 'sign_in', :to => 'home#index', :as => :new_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_session
  end

  root :to => "home#index"
end
