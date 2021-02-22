Rails.application.routes.draw do
  root to: "owners#index"

  resources :owners do
    resources :machines, only: [:index]
  end

  get '/owners', to: 'owners#index'
  get '/owners/:id', to: 'owners#show'

  get '/owners/:owner_id/machines', to: 'machines#index'
  get '/owners/:owner_id/machines/:machine_id', to: 'machines#show'

  get '/snacks/:id', to: 'snacks#show'
  get '/snacks', to: 'snacks#index'
end
