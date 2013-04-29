Waitstaff::Application.routes.draw do
  root :to => 'pages#index'

  resource :user_session
  resource :account, controller: 'users'
  resources :locations
  resources :option_groups do
    resources :options
  end
  resources :categories do
    resources :items
  end

  resource :restaurant
  resource :control_panel, controller: 'location_sessions'
end
