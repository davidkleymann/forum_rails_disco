DiscoBlog::Application.routes.draw do

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

  get '/' => 'home#index'
  get '/admins' => 'home#admins'

  get 'event_stream' => 'event_source#stream'

end