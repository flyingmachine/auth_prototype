AuthPrototype::Application.routes.draw do
  resources :sessions
  resources :users do
    member do
      get 'reset'
    end
  end
  resource  :quotes
  
  # handles policies
  match ':controller(/:action(/:id(.:format)))'
end
