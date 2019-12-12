Rails.application.routes.draw do
  root 'users/home#index'
  
  get :questions, to: 'users/about#questions'
  get :corporation, to: 'users/about#corporation'
  get :privacy, to: 'users/about#privacy'
  get :terms, to: 'users/about#terms'
  
  get :login, to: 'users/login#new'
  delete :logout, to: 'users/login#destroy'
  
  namespace :api do
    resources :article_image, only: %i[create]
  end
  
  scope module: :users do
    resources :informations, only: %i[index]
    resources :articles, only: %i[index show]
    
    resources :opinions, only: %i[create]
    resources :inquiries, only: %i[new create] do
      collection do
        get :complete
      end
    end
    
    resources :login, only: %i[create]
    
    post 'oauth/callback' => 'oauths#callback'
    get 'oauth/callback' => 'oauths#callback'
    get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
    
    resources :signup, only: %i[new create] do
      member do
        get :activate
      end
    end
    
    resources :ramen_shops, except: %i[destroy] do
      resources :bookmarks, only: %i[create destroy]
      resources :completions, only: %i[create destroy]
    end
    
    resources :reviews, except: %i[new] do
      resources :likes, only: %i[create destroy]
    end
    
    resources :ranking, only: %i[index]
    
    namespace :mypage do
      get :reviews
      get :bookmarks
      get :events
      get :charts
      get :profile
      get :email
      get :password
    end
    
    scope :mypage do
      resources :dashboard, only: %i[index]
      resources :events, only: %i[create destroy]
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
  
  namespace :admins do
    resources :dashboard, only: %i[index]
    resources :users, only: %i[index new create edit update destroy]
    resources :inquiries, only: %i[index show]
    resources :opinions, only: %i[index]
    resources :notifications, only: %i[index]
    resources :articles, only: %i[index new create edit update destroy]
    resources :informations, only: %i[index new create edit update destroy]
  end
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
  get '*path', controller: 'application', action: 'render_404'
end
