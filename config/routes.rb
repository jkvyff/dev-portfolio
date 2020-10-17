Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }
  
  resources :projects, except: [:show] do
    patch :sort, on: :collection
  end

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  resources :projects, except: [:show]
  
  get 'project/:id', to: 'projects#show', as: 'project_show'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
