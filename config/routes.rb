Rails.application.routes.draw do
  resources :users, only: [:create]
  scope :users do
    get 'me', to: 'users#me'
  end

  resources :sessions, only: [:create]

  resources :posts, only: %i[index create]
  scope :posts do
    post ':post_id/comments', to: 'comments#create'
    delete ':post_id/comments/:id', to: 'comments#destroy'
    put ':post_id/like', to: 'likes#like_post'
    put ':post_id/unlike', to: 'likes#unlike_post'
  end
end
