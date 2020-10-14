Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "homes/about" => "homes#about"
  resources :users, only: [:index, :show, :edit]
  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
