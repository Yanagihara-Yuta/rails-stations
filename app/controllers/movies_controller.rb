class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        @title = "TopPage"
    end

    def search 
        @search_name = params[:search]
        @search_is_showing = params[:is_showing]
        # --------------------------------------------------
        #   
        # 
        # --------------------------------------------------
        if @search_is_showing == "all"
            if @search_name == ""
                @search_name = "指定なし"
                @movies = Movie.all
            else
                @movies = Movie.where(['name LIKE ?', "%#{@search_name}%"]).or(Movie.where(['description LIKE ?', "%#{@search_name}%"]))
            end
            @search_is_showing = "すべて"
        else
            if @search_name == ""
                @search_name = "指定なし"
                @movies = Movie.where(is_showing: @search_is_showing)
            else
                @movies = Movie.where(is_showing: @search_is_showing).where(['name LIKE ?', "%#{@search_name}%"]).or(Movie.where(['description LIKE ?', "%#{@search_name}%"]))
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
        if @search_name != "指定なし"
            @search_name = '" ' + @search_name + ' "' 
        end
        render :index
    end

end
