Rails.application.routes.draw do
  # resources :menus, only: %i(index)
  post '/menus', to: 'menus#index'
end
