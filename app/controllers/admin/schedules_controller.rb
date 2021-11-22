class Admin::SchedulesController < ApplicationController
  def index
  end

  def edit
    id_saerch_schedule()
    @movie = Movie.find_by(id: @schedule.movie_id)
end

def update
    if Schedule.find_by(id: params[:id]) == nil
        redirect_to action: :edit,id:params[:id]
    else
        @schedule = Schedule.find_by(id: params[:id])
        params_schedule = params.require(:schedule).permit( :start_time , :end_time , :updated_at)
        if @schedule.update(params_schedule)
            redirect_to "/admin/movies"
        else
            redirect_to action: :edit,id:params[:id]
        end
    end
end

def destroy
    id_saerch_schedule()
    if @schedule.destroy
        redirect_to admin_movies_path , status:302
    else
        redirect_to admin_movies_path
    end
end

def id_saerch_schedule
    if Schedule.find_by(id: params[:id]) == nil
        redirect_to admin_movies_path , status:200
        exit
    else
        @schedule = Schedule.find_by(id: params[:id])
    end
end


end
