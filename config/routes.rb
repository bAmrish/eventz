Rails.application.routes.draw do
  resources :categories
  root 'events#index'
  get 'events/filter/:filter' => "events#index", as: :filtered_events

  resources :events do
    resources :likes
    resources :registrations    
  end

  resource 'session', only: [:new, :create, :destroy]
  
  resources :users

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

end
