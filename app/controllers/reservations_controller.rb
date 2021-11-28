class ReservationsController < ApplicationController
    def index
        
    end

    def new
        @movie_id = params[:movie_id]
        @schedule_id = params[:schedule_id]
        @movies = Movie.find_by(id: @movie_id)
        @schedule = Schedule.find_by(movie_id: @schedule_id)
        @reservations = Reservation.new
    end
end
