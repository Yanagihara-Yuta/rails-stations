class Admin::MoviesController < ApplicationController
# R機能
    def index
        @title = "Management Page"
        @name = ""
        @movies = Movie.all
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
                redirect_to "/admin/movies"
            else
                flash[:alert] = 'メッセージを入力してください。'
                redirect_to admin_movies_new_path , status:200
            end
    end
    def show
    end
# U機能
    def edit
        id_saerch()
    end
    
    def update
        id_saerch()
        params_update = params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url, :updated_at)
        if @movie.update(id: params[:id])
            flash.now[:alert] = 'メッセージを入力した。'
            redirect_to admin_movies_path , status:200
        else
            flash[:alert] = 'メッセージを入力してください。'
            redirect_to action: :edit,id:@movie.id 
        end
    end  
    def destroy
        id_saerch()
        if @movie.find(id: params[:id]).destroy
            flash.now[:alert] = '削除した。'
            redirect_to admin_movies_path , status:200
        else
            flash[:alert] = '削除できなかった。'
            redirect_to admin_movies_path
        end
    end

    def id_saerch
        if Movie.find_by(id: params[:id]) == nil
            redirect_to "/admin/movies"
            exit
        else
            @movie = Movie.find(params[:id])
        end
    end
end