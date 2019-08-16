Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users
  resources :posts
  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'

end
