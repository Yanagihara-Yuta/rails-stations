class ReservationsController < ApplicationController
    def new
        @movies = Movie.find_by(id: params[:movie_id])
        @schedule = Schedule.where(movie_id: :schedule_id)
        @reservations = Reservation.new
    end
end
