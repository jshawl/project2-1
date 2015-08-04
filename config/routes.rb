Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "users#welcome"

  get 'users/sign_in', to: 'users#sign_in'  #Had to move these up because users/show was catching users/sign_in
  post 'users/sign_in', to: 'users#sign_in!'
  get 'users/sign_out', to: 'users#sign_out'

  resources :users do
    resources :bids
  end

  resources :managers do
    resources :posts
  end

end
