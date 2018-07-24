Rails.application.routes.draw do
  scope :users do
    get 'me', to: 'users#me'
    get ':id/posts', to: 'posts#index'
    put ':id/follow', to: 'follows#create'
    delete ':id/unfollow', to: 'follows#destroy'
  end
  resources :users, only: %i[create show]

  resources :sessions, only: :create

  scope :posts do
    post ':post_id/comments', to: 'comments#create'
    delete ':post_id/comments/:id', to: 'comments#destroy'
    put ':post_id/like', to: 'likes#like_post', as: 'like_post'
    put ':post_id/unlike', to: 'likes#unlike_post', as: 'unlike_post'
  end
  resources :posts, only: %i[index create]

  scope :comments do
    put ':comment_id/like', to: 'likes#like_comment', as: 'like_comment'
    put ':comment_id/unlike', to: 'likes#unlike_comment', as: 'unlike_comment'
  end

  scope :feed do
    get '', to: 'feeds#index'
  end
end
