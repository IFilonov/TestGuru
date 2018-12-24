Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get :delete, to: "sessions#delete"

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :responses, shallow: true, only: %i[show update]  do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, except: :index, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
