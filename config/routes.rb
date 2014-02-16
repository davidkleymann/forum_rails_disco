
DiscoBlog::Application.routes.draw do

  resources :themas do 
      resources :topics do
        resources :posts
      end
  end

  resources :adminmessages

  post '/login' =>'users#login'


  resources :users

  get '/userpage' => 'users#userpage'
  
  get '/' =>'home#index'
    get '/admins' =>'home#admins'

  get 'event_stream' => 'event_source#stream'

end

