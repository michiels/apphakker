Apphakker::Application.routes.draw do
  devise_for :players, :controllers => { :omniauth_callbacks => "players/omniauth_callbacks"}

  root :to => "home#index"
end
