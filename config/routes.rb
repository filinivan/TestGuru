Rails.application.routes.draw do
  
  get :login, to: 'sessions#new'
  get :signup, to: 'users#new'
  delete :logout, to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end  
  
  resources :test_passages, only: %i[ show update] do
    member do
      get :result
    end 
  end 

  resources :users, only: :create
  get :signup, to: 'users#new'

end
