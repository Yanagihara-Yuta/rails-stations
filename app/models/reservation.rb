class Reservation < ApplicationRecord
    def index
        @reservation = Reservation.all
    end

    def new
        @title = "Reservation Page"
        @reservation = Reservation.new
        @movie = Movie.find_by(id: params[:id])
        @schedule = Schedule.find_by(schedule_id: params[:schedule_id])
        @sheets = Sheet.all
    end
end
