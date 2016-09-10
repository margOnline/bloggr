Rails.application.routes.draw do
  resources :users, only: [:new, :create, :delete] do
    resources :posts, only: [:index, :new, :create, :delete]
  end
  root 'posts#index'
end
