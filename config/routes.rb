Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/signup', to: 'users#signup'
  post '/login',  to: 'users#login'

  post '/:username/:collection/', to: 'items#create'
  get  '/:username/:collection/', to: 'items#index'
  get  '/:username/:collection/:id', to: 'items#show'
  put  '/:username/:collection/:id', to: 'items#update'
  delete '/:username/:collection/:id', to: 'items#destroy'
end
