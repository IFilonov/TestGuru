Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tests#index'
  get :signup, to: "users#new"
  get :login, to: "sessions#new"
  get :delete, to: "sessions#delete"

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :responses, shallow: true, only: %i[show update]  do
    member do
      get :result
    end
  end

  resources :users
  resources :sessions, only: :create

end
