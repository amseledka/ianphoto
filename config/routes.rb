Ianphoto::Application.routes.draw do
  get "calendar_records/index"

  get "calendar_records/show"

  get "calendar_records/destroy"

  get "calendar_records/new"

  get "calendar_records/create"

  get "calendar_records/edit"

  get "calendar_records/update"

  resources :photos
  resources :categories
  resources :users
  resources :user_sessions

  match '/:slug.html' => 'static_pages#show', :as => :static_page
  match 'login' => "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  
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
