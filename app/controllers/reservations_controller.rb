class ReservationsController < ApplicationController
    def index
        @movie_id = params[:movie_id]
        @schedule_id = params[:schedule_id]
        @movies = Movie.find_by(id: @movie_id)
        @schedule = Schedule.find_by(movie_id: @schedule_id)
        @sheets = Sheet.all
        @column = 5
        @row = ["a","b","c"]
        @leg = @sheets.length
    end

    def new
        @sheet = params[:sheet]
        @movie_id = params[:movie_id]
        @schedule_id = params[:schedule_id]
        @movies = Movie.find_by(id: @movie_id)
        @schedule = Schedule.find_by(movie_id: @schedule_id)
        @reservations = Reservation.new
    end

    def create
        @name = params[:name]
        @email = params[:email]
        @movie_id = params[:movie_id]
        @schedule_id = params[:schedule_id]
        @schedule = Schedule.find_by(movie_id: @schedule_id)
        
    end
end
