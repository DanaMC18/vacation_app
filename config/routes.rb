Rails.application.routes.draw do
  resources :users
  
  shallow do
    resources :listings do
      resources :bookings
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  

end
