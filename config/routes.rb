Rails.application.routes.draw do
  

devise_for :users
resources :posts
resources :comments
root "posts#index"

get "profile/:id" => "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
