Rails.application.routes.draw do
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions'
  }

  root to: 'homes#top'

  get 'home/about' => 'homes#about'

  resources :users, only: [:show, :index, :edit, :update]

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
end

  # get 'favorites/create'
  # get 'favorites/destroy'
  # get 'book_comments/create'
  # get 'book_comments/destroy'