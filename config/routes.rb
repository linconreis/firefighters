Rails.application.routes.draw do
  
  root 'welcome#index'

  get 'login', to: 'auth#index'

  post 'sign_in', to: 'auth#sign_in'

  get 'logout', to: 'auth#logout'

  
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
