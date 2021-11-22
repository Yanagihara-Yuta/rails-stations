Rails.application.routes.draw do
  namespace :admin do
    get 'schedules/index'
  end
  namespace :admin do
    resources :movies, only: [:index, :new, :create, :edit, :update,:destroy, ]
    resources :schedules, only: [ :edit, :update,:destroy, ]
    get "movies/search" => "movies#search"
    get "schedules" => "movies#schedule"
    get "movies/:id/schedules/new" => "movies#schedule_new"
    post "movies/:id/schedules/new" => "movies#schedule_new"

  end
    get "/movies" => "movies#index"
    get "/movies/search" => "movies#search"
    get "/movies/:id" => "movies#show"
    get "/sheets" => "sheets#index"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end