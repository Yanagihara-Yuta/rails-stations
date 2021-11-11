Rails.application.routes.draw do
  namespace :admin do
    resources :movies
  end
  resource :movies, only: [ :index ]
    get "/" => "movies#index"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end