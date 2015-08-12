Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "welcome#index"
  get '/sign_out', to: 'welcome#sign_out' #Could I put this someplace else?
  # yes! I recommend a sessions controller and resources :sessions
  get '/auth/:provider/callback', to: 'users#oauth_create'

  get 'users/sign_in', to: 'users#sign_in'  #Had to move these up because users/show was catching users/sign_in
  post 'users/sign_in', to: 'users#sign_in!'
  # your issue will be resolved if you move to a sessions controller

  get 'managers/sign_in', to: 'managers#sign_in'
  post 'managers/sign_in', to: 'managers#sign_in!'

  resources :users
  resources :managers

  resources :posts do
    resources :bids
  end

end
