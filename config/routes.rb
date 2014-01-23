DiscoBlog::Application.routes.draw do

  post '/login' =>'users#login'


  resources :users

  get '/userpage' => 'users#userpage'


  resources :topics do

  resources :posts

  end

  get 'event_stream' => 'event_source#stream'

end
