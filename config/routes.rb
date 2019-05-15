Rails.application.routes.draw do
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: "users/registrations"
      }

  resources :users do
    resources :vehicles
    resources :roles
  end



  get "/vehicles" => "vehicles#all_vehicles", as: "all_vehicles"
  patch "/users/:user_id/vehicles/:id/checkout" => "vehicles#checkout", as: "checkout" 

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
