Rails.application.routes.draw do
  root 'users/home#index'
  
  get :privacy, to: 'users/about#privacy'
  get :terms, to: 'users/about#terms'
  
  get :login, to: 'users/login#new'
  delete :logout, to: 'users/login#destroy'
  
  scope module: :users do
    resources :login, only: %i[create]
    
    post 'oauth/callback' => 'oauths#callback'
    get 'oauth/callback' => 'oauths#callback'
    get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
    
    resources :signup, only: %i[new create] do
      member do
        get :activate
      end
    end
    
    resources :ramen_shops, except: %i[destroy]
    
    resources :reviews, except: %i[new] do
      resources :likes, only: %i[create destroy]
    end
    
    resources :ranking, only: %i[index]
    
    namespace :mypage do
      get :review
      get :profile
      get :email
      get :password
    end
    
    scope :mypage do
      resources :dashboard, only: %i[index]
      resources :reviews, only: %i[index show]
      resources :profiles, only: %i[update]
      resources :email, only: %i[update]
      resources :password, only: %i[update]
    end
    
    resources :password, only: %i[new create edit] do
      member do
        patch :reset
      end
    end
  end
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
