class Admin::MoviesController < ApplicationController

    # R機能
    def index
        @title = "Management Page"
        @name = ""
        @movies = Movie.all
        @search_name = ""
    end
# C機能
    def new
        @movie = Movie.new
    end
    def create 
        params_create = params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
        @movie = Movie.new(params_create)
        # sql_insert.execute(name,year,description,image_url,is_showing,created_at,updated_at)
            if @movie.save
                flash.now[:alert] = 'メッセージを入力した。'
                redirect_to admin_movies_path 
            else
                flash[:alert] = 'メッセージを入力してください。'
                redirect_to admin_movies_new_path , status:200
            end
    end
    def show
        @id = params[:id]
        @movie = Movie.find_by(id: @id)
    end
# U機能
    def edit
        id_saerch()
    end

    def update
        if Movie.find_by(id: params[:id]) == nil
            redirect_to "/admin/movies"
        else
            @movie = Movie.find(params[:id])
            params_update = params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url, :updated_at)
            if @movie.update(params_update)
                flash.now[:alert] = 'メッセージを入力した。'
                redirect_to admin_movies_path
            else
                flash[:alert] = 'メッセージを入力してください。'
                redirect_to action: :edit,id:@movie.id
            end
        end  
    end

# D機能
    def destroy
        @movie = Movie.find(params[:id])
        if @movie.destroy
            flash.now[:alert] = '削除した。'
            redirect_to admin_movies_path , status:302
        else
            flash[:alert] = '削除できなかった。'
            redirect_to admin_movies_path
        end
    end
# 検索
    def search 
        @search_name = params[:search]
        @search_is_showing = params[:is_showing]
        if @search_is_showing == "all" || @search_is_showing == nil
            if @search_name == ""
                @movies = Movie.all
            else
                @movies = Movie.where(['name LIKE ?', "%#{@search_name}%"]).or(Movie.where(['description LIKE ?', "%#{@search_name}%"]))
            end
            @search_is_showing = "すべて"
        else
            if @search_name == ""
                @movies = Movie.where(is_showing: @search_is_showing)
            else
                @movies = Movie.where(is_showing: @search_is_showing)
                @movies = @movies.where(['name LIKE ?', "%#{@search_name}%"]).or(@movies.where(['description LIKE ?', "%#{@search_name}%"]))
            end
            case @search_is_showing
                when "1" then
                    @search_is_showing = "上映中"
                when "0" then
                    @search_is_showing = "上映予定"
                else
                    @search_is_showing = "想定外のエラー"
            end
        end
        if @search_name == ""
            @search_name = "指定なし"
            @search_name_return = ""
        else
            @search_name_return = @search_name
        end
        render :index
    end
    def id_saerch
        if Movie.find_by(id: params[:id]) == nil
            redirect_to admin_movies_path , status:200
            exit
        else
            @movie = Movie.find(params[:id])
        end
    end
end