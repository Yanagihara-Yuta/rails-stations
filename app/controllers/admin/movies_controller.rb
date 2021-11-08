class Admin::MoviesController < ApplicationController
    def index
        @title = "Management Page"
        @name = ""
        @movies = Movie.all
    end

    def new
        @movie = Movie.new
    end
    def create 
        params_create = params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
        @movie = Movie.create(params_create)
        # sql_insert.execute(name,year,description,image_url,is_showing,created_at,updated_at)
            if @movie.valid?
                flash.now[:alert] = 'メッセージを入力した。'
                redirect_to admin_movies_path
            else
                flash.now[:alert] = 'メッセージを入力してください。'
                redirect_to admin_movies_new_path
            end

    end
end
