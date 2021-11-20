class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        @title = "TopPage"
        @search_name = ""
    end

    def search 
        @title = "TopPage"
        # ---------------------------------------------------------
        #   1. 送信されたデータを受け取る
        #   2. @search_is_showingが"すべて"か違うか判断
        #   3. @search_nameに値が入っているか判断
        #   4. @search_is_showingをviewに表示するように加工
        #   5. @search_nameをviewに表示するように加工
        #   全体像は処理が複雑になったらかく
        # ---------------------------------------------------------

        # 1
        @search_name = params[:search]
        @search_is_showing = params[:is_showing]
        # 2
        if @search_is_showing == "all" || @search_is_showing == nil
            # 3
            if @search_name == ""
                # "すべて"かつキーワードなしなのでall
                @movies = Movie.all
            else
                @movies = Movie.where('name LIKE ?', "%#{@search_name}%").or(Movie.where('description LIKE ?', "%#{@search_name}%"))
            end
            # @search_is_showingをviewに表示させる準備
            @search_is_showing = "すべて"
        else
            # 3
            if @search_name == ""
                @movies = Movie.where(is_showing: @search_is_showing)
                # @test = Movie.where(is_showing: @search_is_showing)の方がコードの保守的に良い
            else
                @movies = Movie.where(is_showing: @search_is_showing)
                @movies = @movies.where(['name LIKE ?', "%#{@search_name}%"]).or(@movies.where(['description LIKE ?', "%#{@search_name}%"]))
                end
            # @search_is_showingをviewに表示させる準備
            case @search_is_showing
                when "1" then
                    @search_is_showing = "上映中"
                when "0" then
                    @search_is_showing = "上映予定"
                else
                    # なにがあってもいいように例外処理
                    @search_is_showing = "想定外のエラー"
            end
        end
        # ------------------------------------------------------------------------------------------------------------------
        #   5
        #   @search_nameをテキストボックスに入れると指定なしの場合に"指定なし"が挿入されるので@search_name_returnで一枚かんであげる
        # ------------------------------------------------------------------------------------------------------------------
        if @search_name == "" # nil or blankの方が良い
            @search_name = "指定なし"
            @search_name_return = ""
        else
            @search_name_return = @search_name
        end
        render :index
    end

end
# コメント：処理の意図を詳しく書く　　処理の説明はあまりいらない