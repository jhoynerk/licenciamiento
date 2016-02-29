Licenciamiento::Application.routes.draw do  
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
    get "/login", to: "devise/sessions#new", as: :login    
  end

  get '/dashboard', to: 'dashboard#index', as: :dashboard


end
