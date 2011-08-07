AuthPrototype::Application.routes.draw do
  resources :sessions
  resources :users
  resource  :quotes
  
  # handles policies
  match ':controller(/:action(/:id(.:format)))'
end
