Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :posts, only: [:create]

  scope :users do
    get 'me', to: 'users#me'
  end
end
