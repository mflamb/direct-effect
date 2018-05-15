Rails.application.routes.draw do
  

  devise_for :users, path: "users", :controllers => { 
    :sessions => "users/sessions", only: [:new, :destroy],
    :registrations => "users/registrations",
    :passwords => "users/passwords",
    :confirmations => "users/confirmations" 
  }

  resources :organizations
  resources :needs, only: [:edit, :update]
  resources :users, only: [:edit, :destroy]

  devise_scope :user do
    get 'users/sign_up', to: 'users/registrations#new'
    get 'users/sign_in', to: 'users/sessions#new'
    delete 'users/sign_out', to: 'users/sessions#destroy'
    get 'organizations/:id', to: 'organizations#show' 
    # root to: 'map#index'
      authenticated :user do
      #     patch :enable
      #     patch :disable
        root to: "organizations#show", as: "authenticated_user_root"
      end 
  
      unauthenticated do
        root to: "map#index", as: "unauthenticated_user_root"
      end
    end

  devise_for :admins, path: "admins", :controllers => { 
    :sessions => "admins/sessions", only: [:new, :destroy],
    # :registrations => "admins/registrations",
    # :passwords => "admins/passwords",
    # :confirmations => "admins/confirmations" 
  }

  devise_scope :admin do
    root to: "organizations#index", as: "admin_root"
    get 'admins/sign_in', to: 'admins/sessions#new'
    delete 'admins/sign_out', to: 'admins/sessions#destroy'
    get 'admins/organizations', to: 'organizations#index' 
    get 'admins/organizations/:id', to: 'organizations#show'
    put 'users/:id/approve' => 'users#approve_user', as: 'approve_user'
    # root to: 'organizations#index', as: "authenticated_admin_root"
    ## COME BACK TO THIS, AFTER ADMIN AUTHENTICATION IS WORKING USE THESE ROOT PATHS BELOW
      # resources :organizations
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
