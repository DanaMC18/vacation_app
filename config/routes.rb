Rails.application.routes.draw do
  
  shallow do
    resources :listings do
      resources :bookings
    end
  end

  shallow do 
    resources :users do
      resources :bookings
    end
  end

end
