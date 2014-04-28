DiscoForum::Application.routes.draw do

  resources :subscriptions, only: [:new, :create, :edit, :update, :destroy]

  resources :themas do
    resources :topics, shallow: true do
      resources :posts, only: [:new, :create]
    end
  end

  get '/topics', to: 'topics#index'

  resources :posts, only: [:edit, :update, :destroy]

  resources :admin_messages

  resources :users do
    member do
      put 'ban'
      put 'unban'
      get 'verificated'
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

  get 'event_source/:projection/:event' => 'event_source#projected'
  root to: 'home#index'
end
