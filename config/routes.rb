DiscoForum::Application.routes.draw do

  resources :subscriptions, only: [:new, :create, :edit, :update, :destroy]

  resources :themas do
    resources :topics, shallow: true do
      resources :posts, only: [:new, :create]
    end
  end

  resources :posts, only: [:edit, :update, :destroy]

  resources :adminmessages

  resources :users do
    member do
      put 'ban'
      put 'unban'
    end
    collection do
      get 'userpage'
      post 'logout'
      post 'login'
      get 'banned'
    end
  end

  resources :roles, only: [:edit, :update]

  
  get '/admins', to: 'home#admins'

  get 'event_stream', to: 'event_source#stream'
  root to: 'home#index'
end