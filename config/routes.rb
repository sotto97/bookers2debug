Rails.application.routes.draw do
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions'
  }

  root to: 'homes#top'

  get 'home/about' => 'homes#about'

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:show, :index]
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
end
