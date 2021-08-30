Rails.application.routes.draw do
  devise_for :users
  
  root to: 'pages#home'

  
  
  
  resources :users do
    resources :events, except: [:destroy] do
      resources :invites, except: [:destroy]
    end
  end
  
  resources :events_users, except: [:destroy]


resources :events do
  resources :users, except: [:destroy] do
    resources :invites, except: [:destroy]
  end
end




  # resources :events
  # resources :events do
  #   resources :invitations, except: [:destroy]
  # end
  # resources :invitations, only: [:destroy]
  # resources :places

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
