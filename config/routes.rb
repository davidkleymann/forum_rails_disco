DiscoBlog::Application.routes.draw do

  post '/login' =>'users#login'


  resources :users

  get '/userpage' => 'users#userpage'


  resources :topics 

  resources :posts

  get '/' =>'home#index'

  get 'event_stream' => 'event_source#stream'

end
