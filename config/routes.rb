Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root to: 'campaigns#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')


  resources :campaigns do
    resources :characters
    resources :sessions, only: [:create]
  end
  resources :characters, only: [] do
    resources :responsibilities
    resources :sessions, only: [] do
      resources :character_sessions, only: [:create]
    end
  end
end
