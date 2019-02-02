Rails.application.routes.draw do
  root to: 'todo_lists#index'
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: %i[new create destroy]
  resources :todo_lists do
    resources :todo_items
  end
end
