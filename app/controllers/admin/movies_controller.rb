class Admin::MoviesController < ApplicationController
    def index
        @title = "Management Page"
        @name = ""
        if request.post?
        name = params[:name]
        year = params[:year]
        description = params[:description]
        image_url = params[:image_url]
        is_showing = params[:is_showing]
        created_at = Time.zone.now()
        updated_at = Time.zone.now()
        @sql_insert = Movie.new(name:name,year:year,description:description,image_url:image_url,is_showing:is_showing,created_at:created_at,updated_at:updated_at)
        # sql_insert.execute(name,year,description,image_url,is_showing,created_at,updated_at)
            if @sql_insert.save
                flash.now[:alert] = 'メッセージを入力した。'
            else
                flash.now[:alert] = 'メッセージを入力してください。'
                render action: 'new'
            end
        end
        @movies = Movie.all
    end

    def new

    end


end
