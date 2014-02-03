DiscoBlog::Application.routes.draw do

<<<<<<< HEAD
  resources :themas
=======
  resources :adminmessages
>>>>>>> d6c676ff2d2fea178b5423709a41d1a5ba6e26e0

  post '/login' =>'users#login'


  resources :users

  get '/userpage' => 'users#userpage'


  resources :topics 

  resources :posts

  get '/' =>'home#index'
    get '/admins' =>'home#admins'

  get 'event_stream' => 'event_source#stream'

end
