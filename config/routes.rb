Blog::Application.routes.draw do
  
  match "/followers" => "followers#index"
  match "/following" => "friendships#index"
  
  resources :user_blogs
  resources :friendships
  resources :posts

  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index"
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users
  
end
