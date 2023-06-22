Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  post 'books' => 'books#create'
  get "homes/about" => 'homes#about' ,as: "about"
  get "books/about" => 'books#index' ,as:"books_about"
  resources :books, only: [:new, :create, :show, :edit, :destroy]
  resources :users, only: [:show, :edit, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
