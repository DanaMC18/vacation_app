Rails.application.routes.draw do
  resources :users
  
  shallow do
    resources :listings do
      resources :bookings
    end
  end

end
