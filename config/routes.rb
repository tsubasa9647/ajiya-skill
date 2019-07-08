Rails.application.routes.draw do
  resources :menus, only: %i(index)
end
