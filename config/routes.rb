Rails.application.routes.draw do
  
  root 'welcome#index'

  get 'login', to: 'auth#index'

  post 'sign_in', to: 'auth#sign_in'

  get 'logout', to: 'auth#logout'


  # ROTAS ANINHADAS
  resources :districts do
    resources :adresses
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
