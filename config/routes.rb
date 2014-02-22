Applift::Application.routes.draw do
  resources :users
  root 'users#new'

  match '/signup',  to: 'users#new',            via: 'get'  
end
