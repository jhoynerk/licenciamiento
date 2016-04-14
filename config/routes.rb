Licenciamiento::Application.routes.draw do
  root 'dashboard#test'
  resources :licenses
  resources :contracts
  resources :type_licenses
  resources :type_licences
  resources :products
  resources :customers
  devise_for :users, skip: :registrations

  devise_scope :user do
    authenticated :user do
      get '/dashboard', to: 'dashboard#index', as: :authenticated_root
    end

    unauthenticated :user do
      get "/login", to: 'devise/sessions#new', as: :unauthenticated_root
    end
    get "/login", to: "devise/sessions#new", as: :login
  end

  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/test', to: 'dashboard#test', as: :test

  resources :customers
  resources :users

  post 'users/check_validation', to: 'users#check_validation'
  post '/generar_serial', to: 'licenses#generate_serial'
  post '/validate_licenses', to: 'licenses#validate_licenses', as: :validate_license
  post '/remove_licenses', to: 'licenses#remove_computer', as: :remove_licenses
  post '/remover_equipo', to: 'licenses#remover_equipo', as: :remover_equipo
  post '/reanudar_equipo', to: 'licenses#reanudar_equipo', as: :reanudar_equipo


  get '/reports_date', to: 'reports#date', as: :report_date
  get '/reports_expired', to: 'reports#expired', as: :report_expired
  #get '/reports_expired', to: 'dashboard#index', as: :dashboard
end
