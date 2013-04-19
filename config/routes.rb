Blog::Application.routes.draw do
  
  resources :user_blogs
  resources :friendships
  resources :posts

  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index", :param_name => "dash"
  devise_for :users
  resources :users
  
end
