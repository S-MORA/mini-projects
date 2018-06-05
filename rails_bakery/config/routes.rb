Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cakes
  resources :muffins

  root to: 'home#home'

  post '/cakes/:id/toggle-status', to: 'cakes#toggle_status', as: :toggle_cake_status

  post '/muffins/:id/toggle-status', to: 'muffins#toggle_status', as: :toggle_muffin_status
end
