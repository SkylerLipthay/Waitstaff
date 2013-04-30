Waitstaff::Application.routes.draw do
  root :to => 'pages#index'

  resource :user_session
  
  resource :account, controller: 'users'
  
  resources :locations do
    resources :days
  end

  resources :option_groups do
    resources :options
  end
  
  resources :categories do
    resources :items
  end

  resources :orders do
    member do
      get 'complete'
    end
  end

  resources :past_orders do
    member do
      get 'incomplete'
    end
  end

  resource :control_panel, controller: 'location_sessions'
end
