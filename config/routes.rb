Rails.application.routes.draw do
  

  devise_for :users, path: "users", :controllers => { 
    :sessions => "users/sessions", only: [:new, :destroy],
    :registrations => "users/registrations",
    :passwords => "users/passwords",
    :confirmations => "users/confirmations" 
  }

  resources :organizations
  resources :needs, only: [:new, :create, :edit, :update, :index, :destroy]
  resources :users, only: [:show, :edit, :update, :destroy]

  devise_scope :user do
    get 'users/sign_up', to: 'users/registrations#new'
    get 'users/sign_in', to: 'users/sessions#new'
    delete 'users/sign_out', to: 'users/sessions#destroy'
    get 'organizations/:id', to: 'organizations#show'
    get 'users/needs/index', to: 'needs#index'
      authenticated :user do
        resources :needs, only: [] do
          patch :enable
          patch :disable
        end
        root to: "organizations#show", as: "authenticated_user_root"
      end 
    end

  devise_for :admins, path: "admins", :controllers => { 
    :sessions => "admins/sessions", only: [:new, :create, :destroy]
  }

  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new'
    delete 'admins/sign_out', to: 'admins/sessions#destroy'
    get 'admins/organizations', to: 'organizations#index' 
    get 'admins/organizations/:id', to: 'organizations#show'
    get 'admins/needs/index', to: 'needs#index'
    put 'users/:id/approve' => 'users#approve_user', as: 'approve_user'
      authenticated :admin do
        root to: "organizations#index", as: "authenticated_admin_root"
      end 

      unauthenticated do
        root to: "map#index", as: "unauthenticated_root"
      end
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
