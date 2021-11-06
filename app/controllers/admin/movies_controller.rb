class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
        @title = "Management Page"
  end
end
