Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    resources :registrations    
  end

  resource 'session', only: [:new, :create, :destroy]
  
  resources :users

  get 'signup' => 'users#new'
  delete 'logout' => 'sessions#destroy'

end
