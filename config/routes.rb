DiscoBlog::Application.routes.draw do

  post '/login' =>'users#login'


  resources :users

  get '/userpage' => 'users#userpage'


  resources :topics 

  resources :posts

  

  get 'event_stream' => 'event_source#stream'

end
