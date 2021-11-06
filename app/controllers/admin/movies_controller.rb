class Admin::MoviesController < ApplicationController
  def index
    @title = "Management Page"
    @name = ""
    if request.post?
      @title = "PostManagement Page()"
      name = params[:name]
      year = params[:year]
      description = params[:description]
      image_url = params[:image_url]
      is_showing = params[:is_showing]
      created_at = Time.zone.now()
      updated_at = Time.zone.now()
      @sql_insert = Movie.new(name:name,year:year,description:description,image_url:image_url,is_showing:is_showing,created_at:created_at,updated_at:updated_at)
      # sql_insert.execute(name,year,description,image_url,is_showing,created_at,updated_at)
      if @sql_insert.save!
        render action: 'index'
      else
        flash.now[:alert] = 'メッセージを入力してください。'
        render action: 'new'
      end
    end
    @movies = Movie.all
  end

  def new
    @title = "Create Page"
    @name = "タイトル"
    @year = "公開年"
    @description = "概要"
    @image_url = "画像URL"
    @is_showing = "上映中か"
  end


end
