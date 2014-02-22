Applift::Application.routes.draw do
  resources :users do
    resources :gadgets do
      resources :gadget_images
    end      
  end  

  # resources :gadgets
  resources :sessions, only: [:new, :create, :destroy]  
  root 'sessions#new'
  
  match '/signup',  to: 'users#new',            via: 'get'  
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/image_data/:id', to: 'gadget_images#send_image', via: 'get'
end
