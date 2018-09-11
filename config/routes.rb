Rails.application.routes.draw do
  
  root 'welcome#index'

  get 'login', to: 'auth#index'

  post 'sign_in', to: 'auth#sign_in'

  get 'logout', to: 'auth#logout'

  get 'all_occurrences', to: 'event_logs#index_all'

  get 'first_access', to: 'auth#change_password'

  post 'change_password', to: 'auth#redefine'

  patch 'reset/:id', to: 'firefighters#reset_password'

  get 'institutional', to: 'welcome#institutional'

  
  #ROTAS CRUD
  resources :firefighters 

  resources :pluviometers

  resources :absences
  

  # ROTAS ANINHADAS
  resources :districts do
    resources :adresses
  end

  resources :type_of_cars do
    resources :cars
  end

  resources :type_occurrences do
    resources :event_logs
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

