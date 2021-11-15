Rails.application.routes.draw do
  namespace :admin do
    resources :movies, only: [:index, :new, :create, :edit, :update,:destroy, ]
    get "movies/search" => "movies#search"
  end
    get "/" => "movies#index"
    get "/movies/search" => "movies#search"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end