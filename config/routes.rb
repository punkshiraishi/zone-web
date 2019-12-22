Rails.application.routes.draw do
  root 'tasks#index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # /ユーザ名/タスク番号 みたいなパス
  resources :user, only: [] do
    resources :tasks, only: :index
  end

  # /タスク番号 にPOSTしたらcreate
  resources :tasks, only: [:create, :update]

  namespace :api do
    get 'login', to: 'login#show'
    resources 'tasks', only: [:index, :create, :update]
  end

end
