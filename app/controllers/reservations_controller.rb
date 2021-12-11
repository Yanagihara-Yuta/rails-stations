class ReservationsController < ApplicationController
    def index
        @movie_id = params[:movie_id]
        @schedule_id = params[:schedule_id]
        @sheets = Sheet.all
        @column = 5
        @row = ["a","b","c"]
        @leg = @sheets.length
    end

    def new
        @sheet = params[:sheet]
        @movie_id = params[:movie_id]
        @schedule_id = params[:schedule_id]
        @sheet_id = params[:sheet_id]
        @day = params[:day]
        @movies = Movie.find_by(id: @movie_id)
        @schedule = Schedule.find_by(movie_id: @schedule_id)
        @reservations = Reservation.new
    end

    def create
        params_reservations = params.require(:reservation).permit(:date , :schedule_id , :sheet_id , :email , :name)
        @reservations = Reservation.new(params_reservations)
        @reservations.save
        redirect_to "/movies"
    end
end
