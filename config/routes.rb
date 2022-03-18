Rails.application.routes.draw do

  root to: 'pages#home'

  resources :people do 
    resource :person_clinics, only: [:new, :create]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
