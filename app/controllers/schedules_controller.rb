class SchedulesController < ApplicationController
    def show
        @id = params[:id]
        # @schedules = Schedule.find_by(movie_id: @id)
        @schedules = Schedule.all
    end
end
