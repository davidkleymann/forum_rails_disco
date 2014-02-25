DiscoBlog::Application.routes.draw do

  resources :themas do
    resources :topics, shallow: true do
      resources :posts, only: [:new, :create]
    end
  end

  resources :posts, only: [:edit, :update, :destroy]

  resources :adminmessages

  post '/login' => 'users#login'


  resources :users

  get '/logout' => 'users#logout'
  get '/userpage' => 'users#userpage'

  get '/' => 'home#index'
  get '/admins' => 'home#admins'

  get 'event_stream' => 'event_source#stream'

end

