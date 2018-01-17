Rails.application.routes.draw do
  
  root 'welcome#index'

  get 'login', to: 'auth#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
