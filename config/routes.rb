DiscoBlog::Application.routes.draw do

  post '/login' =>'users#login'
  resources :users

<<<<<<< HEAD
get '/topics' => 'topics#show'
resources :topics
get '/userpage' => 'users#userpage'
=======

  resources :topics do
    resources :posts
  end
>>>>>>> fb67abac3ee45383848c94643295480233aa7111


  get 'event_stream' => 'event_source#stream'
end
