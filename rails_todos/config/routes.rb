Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/todos', to: 'todos#index'  ## todos is controller, index is method 
  get '/todos/new', to: 'todos#new'
  post '/todos/create', to: 'todos#create'
  get '/todos/edit/:id', to: 'todos#edit'
  put '/todos/edit/:id', to: 'todos#update'
  delete '/todos/delete', to: 'todos#destroy'
end
