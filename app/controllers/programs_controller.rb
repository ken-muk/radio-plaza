class ProgramsController < ApplicationController
  def index
    @programs = Program.all.includes(:personalities, :station, corners: :songs).order(:day, :start_time)
    @stations = Station.select(:name).distinct
    @personalities = Personality.select(:occupation).distinct
    @program_days = Program.select(:day).distinct.order(:day)

    if params[:sort]
      if Station.find_by(name: params[:sort])
        program_ids = Station.where(name: params[:sort]).pluck(:program_id)
        @programs = @programs.where(id: program_ids)
      elsif Personality.find_by(occupation: params[:sort])
        program_ids = Personality.where(occupation: params[:sort]).pluck(:program_id)
        @programs = @programs.where(id: program_ids)
      else
        day = params[:sort].to_i
        @programs = @programs.where(day: day).where(start_time: '05:01:00'..'23:59:00').or(@programs.where(day: day+1).where(start_time: '00:00:00'..'05:00:00'))
      end
    end
  end
end
