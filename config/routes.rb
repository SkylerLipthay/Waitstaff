Waitstaff::Application.routes.draw do
  root :to => 'pages#index'

  resource :user_session
  resource :account, :controller => 'users'
  resources :locations
end
