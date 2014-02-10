<<<<<<< HEAD
DiscoBlog::Application.routes.draw do

  resources :admins

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
=======
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
>>>>>>> 908cadeefc9e3517573b840d757a638b03b4bc68
