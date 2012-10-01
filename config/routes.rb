Apphakker::Application.routes.draw do
  devise_for :players, :controllers => { :omniauth_callbacks => "players/omniauth_callbacks"}

  devise_scope :player do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_player_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_session
  end

  root :to => "home#index"
end
