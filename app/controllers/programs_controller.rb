class ProgramsController < ApplicationController
  def index
    @programs = Program.all.includes(:personalities, :station, corners: :songs).order(:day)
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
        @programs = @programs.where(day: params[:sort])
      end
    end
  end
end
