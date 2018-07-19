Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :posts, only: %i[index create]

  scope :posts do
    put ':post_id/like', to: 'posts#like'
    post ':post_id/comments', to: 'comments#create'
  end

  scope :users do
    get 'me', to: 'users#me'
  end
end
