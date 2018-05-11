Rails.application.routes.draw do
  

  get 'users/new'
  get 'users/create'
  get 'usersnew/create'
  devise_for :users, path: "users", :controllers => { 
    :sessions => "users/sessions",
    :registrations => "users/registrations",
    :passwords => "users/passwords",
    :confirmations => "users/confirmations" 
  }

  resources :organizations, only: [:show]
  resources :needs, only: [:edit, :update]

  devise_scope :user do
    get 'users/sign_up', to: 'users/registrations#new'
    get 'users/sign_in', to: 'users/sessions#new'
    delete 'users/sign_out', to: 'users/sessions#destroy'
    get 'organizations/:id', to: 'organizations#show' 
    root to: 'map#index'
      authenticated do
      #     patch :enable
      #     patch :disable
        root to: "organizations#show", as: "authenticated_user_root"
      end 
  
      unauthenticated do
        root to: "map#index", as: "unauthenticated_user_root"
      end
    end

  devise_for :admins, path: "admins", :controllers => { 
    :sessions => "admins/sessions",
    :registrations => "admins/registrations",
    :passwords => "admins/passwords",
    :confirmations => "admins/confirmations" 
  }

  devise_scope :admin do
    get 'admins/sign_up', to: 'admins/registrations#new'
    get 'admins/sign_in', to: 'admins/sessions#new'
    delete 'admins/sign_out', to: 'admins/sessions#destroy'
    root to: 'map#index'
    # authenticated do
    #   resources :organizations
    #   root to: "organizations#index", as: "authenticated_admin_root"
    # end

    # unauthenticated do
    #   root to: "map#index", as: "unauthenticated_admin_root"
    # end
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
