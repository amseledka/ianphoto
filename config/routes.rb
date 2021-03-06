Ianphoto::Application.routes.draw do
  get "main/index"

  resources :photos
  resources :categories
  resources :users do
    member do
      get 'calendar'
      get 'edit_account'
      get 'edit_calendar'
    end
  end
  resources :user_sessions
  resources :calendar_records
  resources :static_pages
  
  match 'login' => "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  match '/send_invitation/:id' => 'invites#send_invitation', :as => 'send_invitation'
  match '/signup/:invite_code' => 'users#new', :as => 'redeem_invitation'
  match '/publications' => 'static_pages#index', :as => :publications
  match '/publications/:id' => 'static_pages#show'
  match '/:slug.html' => 'static_pages#show', :as => :static_page
  match '/calendar' => 'calendar_records#index', :as => :calendar
  
  resources :contests
  resources :contestants

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
    resources :calendar_records do
      member do
        post :switch
      end
    end
    resources :invites
    root :to => 'main#index'
  end

  root :to => 'main#index'
end
