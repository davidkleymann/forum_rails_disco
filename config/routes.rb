DiscoBlog::Application.routes.draw do
  resources :posts
  
  post '/login' =>'users#login'
  resources :users

get '/topics' => 'topics#show'
resources :topics
get '/userpage' => 'users#userpage'


  get 'event_stream' => 'event_source#stream'
end
