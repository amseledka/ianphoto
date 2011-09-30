Ianphoto::Application.routes.draw do
  resources :invites
  resources :photos
  resources :categories
  resources :users
  resources :user_sessions
  resources :calendar_records
  
  match '/:slug.html' => 'static_pages#show', :as => :static_page
  match 'login' => "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  match '/send_invitation/:id' => 'invites#send_invitation', :as => 'send_invitation'
  match '/signup/:invite_code' => 'users#new', :as => 'redeem_invitation'
  
  resources :users do
    resources :categories do
      resources :photos
    end
  end
  
  namespace :admin do
    resources :photos do
      collection do
        get :bulk_edit
        put :bulk_update
      end
    end
    resources :categories do
      collection do
        put :arrange
      end
    end
    resources :static_pages do
      collection do
        put :arrange
      end
    end
    root :to => 'main#index'
  end

  root :to => 'main#index'
end
