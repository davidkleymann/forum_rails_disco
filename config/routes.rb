DiscoBlog::Application.routes.draw do

  resources :themas

  resources :adminmessages

  post '/login' =>'users#login'


  resources :users

  get '/userpage' => 'users#userpage'


  resources :topics 

  resources :posts

  get '/' =>'home#index'
    get '/admins' =>'home#admins'

  get 'event_stream' => 'event_source#stream'

end
