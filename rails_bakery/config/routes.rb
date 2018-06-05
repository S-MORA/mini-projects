Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cakes
  resources :muffins

  root to: 'home#home'

end
