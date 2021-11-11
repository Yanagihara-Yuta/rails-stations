Rails.application.routes.draw do
  namespace :admin do
    get '/movies' => 'movies#index'
    get '/movies/new' => 'movies#new'
    post '/movies' => 'movies#create'
    get 'movies/:id' => 'movies#edit'
    patch  'movies/:id' , to: 'movies#update'
  end
    get "/" => "movies#index"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
