class Admin::MoviesController < ApplicationController
    def index
        @title = "Management Page"
        @name = ""
        @movies = Movie.all
    end

    def new

    end
    def create 
        name = params[:name]
        year = params[:year]
        description = params[:description]
        image_url = params[:image_url]
        is_showing = params[:is_showing]
        created_at = Time.zone.now()
        updated_at = Time.zone.now()
        sql_insert = Movie.new(name:name,year:year,description:description,image_url:image_url,is_showing:is_showing,created_at:created_at,updated_at:updated_at)
        # sql_insert.execute(name,year,description,image_url,is_showing,created_at,updated_at)
            if sql_insert.save
                flash.now[:alert] = 'メッセージを入力した。'
                redirect_to admin_movies_path
            else
                flash.now[:alert] = 'メッセージを入力してください。'
                render "new"
            end
    end
end
