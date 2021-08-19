Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events
  resources :events do
    resources :invitations, except: [:destroy]
    resources :places, except: [:destroy]
  end
  resources :invitations, only: [:destroy]
  resources :places, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
