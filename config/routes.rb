Rails.application.routes.draw do
  namespace :admin do
    get 'schedules/index'
  end
  namespace :admin do
    resources :movies
    get "movies/search" => "movies#search"
    get "schedules" => "movies#schedule"
    get "movies/:id/schedules/new" => "movies#schedule_new"
    post "movies/:id/schedules/new" => "movies#schedule_new"

  end
    resources :schedules, only: [ :edit, :update,:destroy, ]
    get "reservations/index/:movies_id" => "reservations#index"
    get "/movies/:movie_id/schedules/:schedule_id/sheets" => "sheets#index"
    get "/movies/:movie_id/schedules/:schedule_id/reservations/new" => "reservations#new"
    post "/reservation" => "reservations#create"
    get "/movies" => "movies#index"
    get "/movies/search" => "movies#search"
    get "/movies/:id" => "movies#show"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end