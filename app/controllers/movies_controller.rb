class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        @title = "TopPage"
    end
end
