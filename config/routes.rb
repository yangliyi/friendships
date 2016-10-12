Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/friendships/:friend_id', to: 'friendships#create', as: "add_friend"
  delete '/friendships/:friend_id', to: 'friendships#destroy', as: "unfriend"
  post '/friendships/:friend_id/accept', to: 'friendships#accept', as: "accept_friend"

  root to: 'users#index'

end
