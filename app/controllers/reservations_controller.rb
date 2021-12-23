class ReservationsController < ApplicationController
    def index
        @movie_id = params[:movie_id]
        @schedule_id = params[:schedule_id]
        @date = params[:date]
        @sheets = Sheet.all
        @column = 5
        @row = ["a","b","c"]
        @leg = @sheets.length
    end

    def new
        @movie_id = params[:movie_id]
        @schedule_id = params[:schedule_id]
        @sheet_id = params[:sheet_id]
        @date = params[:date]
        @movies = Movie.find_by(id: @movie_id)
        @schedule = Schedule.find_by(movie_id: @schedule_id)
        @reservations = Reservation.new
        if @date == "" || @sheet_id == ""
            redirect_to "/movies",  status: 404
        end
    end

    def create
        @sheet_id = params[:sheet_id]
        @date = params[:date]
        @reservations = Reservation.new(params_reservations)
        if @reservations.save
            redirect_to "/movies" , status: 302
        else
            redirect_to "/movies/#{params_reservations[:movie_id]}/schedules/#{params_reservations[:schedule_id]}/sheets?date=#{params_reservations[:date]}"
        end
    end

    private

    def params_reservations
        params.require(:reservation).permit(:date , :schedule_id , :sheet_id , :movie_id , :email , :name)
    end
end
