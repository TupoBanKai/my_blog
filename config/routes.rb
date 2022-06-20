Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  
  namespace :admin do
    resources :posts do
      resources :comments
    end
  end

  resources :posts do
    resources :comments
  end
end
