Rails.application.routes.draw do
  namespace :admin do
    resources :movies
  end
  resources :movies, only: [ :index ]

  get '*path', to: 'application#rescue404'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
